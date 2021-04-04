package lineup

import (
	"embed"
	"fmt"
	"html/template"
	"io"

	"github.com/supercaracal/aniwatch/internal/data"
)

var (
	//go:embed *.html.tpl
	tmplFS embed.FS
)

// Row is
type Row struct {
	Title   string
	Start   string
	Channel string
}

// LineupsPerDaySlot is
type LineupsPerDaySlot map[string]map[string][]Row

// IndexData is
type IndexData struct {
	*data.Data
	Title             string
	Quarter           string
	LineupCount       int
	LineupsPerDaySlot *LineupsPerDaySlot
}

type tmplobj struct {
	parsed *template.Template
}

func newTemplate() (*tmplobj, error) {
	parsed, err := template.ParseFS(tmplFS, "*.html.tpl")
	if err != nil {
		return nil, err
	}

	return &tmplobj{parsed: parsed}, nil
}

func (t *tmplobj) render(w io.Writer, name string, dat interface{}) error {
	return t.parsed.ExecuteTemplate(w, fmt.Sprintf("%s.html.tpl", name), dat)
}
