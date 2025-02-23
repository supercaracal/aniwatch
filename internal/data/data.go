package data

import (
	_ "embed" // only import
	"fmt"
	"time"

	"gopkg.in/yaml.v2"
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
		From  int    `yaml:"from"`
		To    int    `yaml:"to"`
	} `yaml:"slot-of-day"`
	Lineups []struct {
		Title         string `yaml:"title"`
		StartTime     string `yaml:"start_time"`
		ChannelCode   string `yaml:"channel"`
		DayOfWeekCode string `yaml:"day_of_week"`
	} `yaml:"lineups"`
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
