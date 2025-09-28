package data

import (
	_ "embed" // only import
	"fmt"
	"time"

	"sigs.k8s.io/yaml"
)

// Data is
type Data struct {
	AppName    string            `json:"app-name"`
	AuthorID   string            `json:"author-id"`
	AuthorName string            `json:"author-name"`
	TvChannel  map[string]string `json:"tv-channel"`
	DayOfWeek  []struct {
		ID   string `json:"id"`
		Name string `json:"name"`
	} `json:"day-of-week"`
	SlotOfDay []struct {
		ID    string `json:"id"`
		Name  string `json:"name"`
		Color string `json:"color"`
		From  int    `json:"from"`
		To    int    `json:"to"`
	} `json:"slot-of-day"`
	Lineups []struct {
		Title         string `json:"title"`
		StartTime     string `json:"start_time"`
		ChannelCode   string `json:"channel"`
		DayOfWeekCode string `json:"day_of_week"`
	} `json:"lineups"`
}

var (
	//go:embed data.yaml
	content []byte
)

// Load is
func Load() (*Data, error) {
	var d Data
	if err := yaml.UnmarshalStrict(content, &d); err != nil {
		return nil, fmt.Errorf("failed to unmarshal data file: %w", err)
	}

	return &d, nil
}

// GetSlot is
func (d *Data) GetSlot(t time.Time) string {
	m := t.Hour()*60 + t.Minute()

	for _, s := range d.SlotOfDay {
		if 60*s.From <= m && m < 60*s.To {
			return s.ID
		}
	}

	return "unknown"
}
