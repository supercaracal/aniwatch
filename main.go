package main

import (
	"context"
	"fmt"
	"html/template"
	"io/ioutil"
	"log"
	"net"
	"net/http"
	"os"
	"os/signal"
	"syscall"
	"time"

	"gopkg.in/yaml.v2"
)

const (
	defaultTimeout        = 3 * time.Second
	defaultRetry          = 3
	defaultProtocol       = "tcp"
	defaultBindingAddress = "0.0.0.0"
	defaultPort           = 3000
	maxHeaderBytes        = 1 << 20
	shutdownTimeout       = 3 * time.Second
	templateFileName      = "index.html.tpl"
	dataFileName          = "data.yaml"
	contentDir            = "docs"
	baseDate              = "2020-01-01"
)

// Data is
type Data struct {
	AppName    string            `yaml:"app-name"`
	AuthorID   string            `yaml:"author-id"`
	AuthorName string            `yaml:"author-name"`
	TvChannel  map[string]string `yaml:"tv-channel"`
	DayOfWeek  []struct {
		ID   string `yaml:"id"`
		Name string `yaml:"name"`
	} `yaml:"day-of-week"`
	SlotOfDay []struct {
		ID    string `yaml:"id"`
		Name  string `yaml:"name"`
		Color string `yaml:"color"`
	} `yaml:"slot-of-day"`
	Lineups []struct {
		Title         string `yaml:"title"`
		StartTime     string `yaml:"start_time"`
		ChannelCode   string `yaml:"channel"`
		DayOfWeekCode string `yaml:"day_of_week"`
	} `yaml:"lineups"`
}

// LineupRow is
type LineupRow struct {
	Title   string
	Start   string
	Channel string
}

// LineupsPerDaySlot is
type LineupsPerDaySlot map[string]map[string][]LineupRow

// TmplData is
type TmplData struct {
	*Data
	Title             string
	Quarter           string
	LineupCount       int
	LineupsPerDaySlot LineupsPerDaySlot
}

type config struct {
	timeout        time.Duration
	retry          int
	protocol       string
	bindingAddress string
	port           int
}

type myLogger struct {
	info *log.Logger
	err  *log.Logger
}

var (
	cfg    *config
	data   *Data
	tmpl   *template.Template
	logger myLogger
)

func initialize() (err error) {
	logger.info = log.New(os.Stdout, "[INFO] ", log.LstdFlags|log.LUTC)
	logger.err = log.New(os.Stdout, "[ERROR] ", log.LstdFlags|log.LUTC)

	cfg = newConfig()
	data, err = loadData(dataFileName)
	if err != nil {
		return err
	}

	tmpl, err = template.ParseFiles(templateFileName)
	if err != nil {
		return fmt.Errorf("Failed to parse template file (%s): %w", templateFileName, err)
	}

	return
}

func newConfig() *config {
	return &config{
		timeout:        defaultTimeout,
		retry:          defaultRetry,
		protocol:       defaultProtocol,
		bindingAddress: defaultBindingAddress,
		port:           defaultPort,
	}
}

func loadData(path string) (*Data, error) {
	content, err := ioutil.ReadFile(path)
	if err != nil {
		return nil, fmt.Errorf("Failed to read data file: %w", err)
	}

	var d Data
	err = yaml.UnmarshalStrict(content, &d)
	if err != nil {
		return nil, fmt.Errorf("Failed to unmarshal data file: %w", err)
	}

	return &d, nil
}

func buildListener(proto string, addr string, port int) (listener net.Listener, err error) {
	tcpAddr, err := net.ResolveTCPAddr(proto, fmt.Sprintf("%s:%d", addr, port))
	if err != nil {
		return
	}

	listener, err = net.ListenTCP(proto, tcpAddr)
	if err != nil {
		return
	}

	return
}

func setUpRESTRouting() {
	http.HandleFunc("/", rootHandler)

	files := []string{"favicon.ico", "style.css"}
	for _, f := range files {
		http.HandleFunc(
			fmt.Sprintf("/%s/%s", data.AppName, f),
			func(w http.ResponseWriter, r *http.Request) {
				http.ServeFile(w, r, fmt.Sprintf("%s/%s", contentDir, f))
			},
		)
	}
}

func buildHTTPServer() *http.Server {
	return &http.Server{
		ReadTimeout:    cfg.timeout,
		WriteTimeout:   cfg.timeout,
		MaxHeaderBytes: maxHeaderBytes,
	}
}

func stopServerGracefully(server *http.Server) {
	c := make(chan os.Signal, 1)
	signal.Notify(c, syscall.SIGTERM, os.Interrupt)
	<-c
	ctx, cancel := context.WithTimeout(context.Background(), shutdownTimeout)
	defer cancel()
	server.Shutdown(ctx)
}

func responseInternalServerError(w http.ResponseWriter) {
	msg := fmt.Sprintf("%d internal server error", http.StatusInternalServerError)
	http.Error(w, msg, http.StatusInternalServerError)
}

func camelize(v string) string {
	return fmt.Sprintf("%s%s", string(v[0]-32), v[1:])
}

func calcQuarter(now time.Time) int {
	var offset int
	if now.Month()%3 == 0 {
		offset = 0
	} else {
		offset = 1
	}
	return int(now.Month())/3 + offset
}

func timeToSlot(t time.Time) (s string) {
	m := t.Hour()*60 + t.Minute()
	if m >= 0 && m < 60*5 {
		s = "midnight"
	} else if 60*5 <= m && m < 60*16 {
		s = "daytime"
	} else if 60*16 <= m && m < 60*19 {
		s = "sunset"
	} else if 60*19 <= m && m < 60*24 {
		s = "night"
	}
	return
}

func buildLineupsPerDaySlot(d *Data) (LineupsPerDaySlot, error) {
	v := LineupsPerDaySlot{}
	for _, e := range d.DayOfWeek {
		v[e.ID] = map[string][]LineupRow{}
		for _, x := range d.SlotOfDay {
			v[e.ID][x.ID] = []LineupRow{}
		}
	}
	for _, e := range d.Lineups {
		t, err := time.Parse(time.RFC3339, fmt.Sprintf("%sT%s:00Z", baseDate, e.StartTime))
		if err != nil {
			return nil, err
		}
		l := LineupRow{
			Title:   e.Title,
			Start:   e.StartTime,
			Channel: d.TvChannel[e.ChannelCode],
		}
		s := timeToSlot(t)
		v[e.DayOfWeekCode][s] = append(v[e.DayOfWeekCode][s], l)
	}

	return v, nil
}

func rootHandler(w http.ResponseWriter, r *http.Request) {
	now := time.Now()
	l, err := buildLineupsPerDaySlot(data)
	if err != nil {
		logger.err.Println(fmt.Errorf("Failed to build lineups: %w", err))
		responseInternalServerError(w)
		return
	}
	d := TmplData{
		Data:              data,
		Title:             camelize(data.AppName),
		Quarter:           fmt.Sprintf("%d年%dQ", now.Year(), calcQuarter(now)),
		LineupCount:       len(data.Lineups),
		LineupsPerDaySlot: l,
	}
	err = tmpl.ExecuteTemplate(w, templateFileName, d)
	if err != nil {
		logger.err.Println(fmt.Errorf("Failed to render html file (%s): %w", templateFileName, err))
		responseInternalServerError(w)
		return
	}
}

func main() {
	var err error

	err = initialize()
	if err != nil {
		logger.err.Println(err)
		os.Exit(1)
	}

	setUpRESTRouting()
	server := buildHTTPServer()

	listener, err := buildListener(cfg.protocol, cfg.bindingAddress, cfg.port)
	if err != nil {
		logger.err.Println(err)
		os.Exit(1)
	}
	defer listener.Close()

	go func() {
		logger.info.Println("Booting up server")
		err := server.Serve(listener)
		if err != nil {
			logger.err.Println(err)
		}
	}()

	stopServerGracefully(server)
	logger.info.Println("Shutting down server")
	os.Exit(0)
}
