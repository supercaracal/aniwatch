package lineup

import (
	"fmt"
	"html/template"
	"io"
	"path/filepath"

	"github.com/supercaracal/aniwatch/internal/data"
)

const (
	indexTmplPath = "internal/lineup/index.html.tpl"
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

type viewTmpl struct {
	tmpl *template.Template
	path string
}

func newIndexTemplate() (*viewTmpl, error) {
	return newTemplate(indexTmplPath)
}

func newTemplate(tmplPath string) (*viewTmpl, error) {
	tmpl, err := template.ParseFiles(tmplPath)
	if err != nil {
		return nil, fmt.Errorf("Failed to parse template file (%s): %w", tmplPath, err)
	}

	return &viewTmpl{tmpl: tmpl, path: tmplPath}, nil
}

func (t *viewTmpl) render(w io.Writer, d *IndexData) error {
	return t.tmpl.ExecuteTemplate(w, filepath.Base(t.path), d)
}
