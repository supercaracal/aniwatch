package lineup

import (
	"bytes"
	"time"

	"github.com/supercaracal/aniwatch/internal/data"
)

// GetIndexHTML is
func GetIndexHTML(dat *data.Data, rootDir string) (*bytes.Buffer, error) {
	var buf bytes.Buffer

	indexTmpl, err := newIndexTemplate(rootDir)
	if err != nil {
		return nil, err
	}

	lineups, err := buildLineupsPerDaySlot(dat)
	if err != nil {
		return nil, err
	}

	indexData := newIndexData(dat, lineups, time.Now())
	if err := indexTmpl.render(&buf, indexData); err != nil {
		return nil, err
	}

	return &buf, nil
}
