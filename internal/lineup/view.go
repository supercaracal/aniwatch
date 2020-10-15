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
	tmpl, err := template.ParseFiles(indexTmplPath)
	if err != nil {
		return nil, fmt.Errorf("Failed to parse template file (%s): %w", indexTmplPath, err)
	}

	return &viewTmpl{
		tmpl: tmpl,
		path: indexTmplPath,
	}, nil
}

func (t *viewTmpl) renderIndex(w io.Writer, d *IndexData) error {
	return t.tmpl.ExecuteTemplate(w, filepath.Base(t.path), d)
}
