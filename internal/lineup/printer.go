package lineup

import (
	"io"
	"time"

	"github.com/supercaracal/aniwatch/internal/data"
)

// Print is
func Print(dat *data.Data, w io.Writer) error {
	indexTmpl, err := newIndexTemplate()
	if err != nil {
		return err
	}

	lineups, err := buildLineupsPerDaySlot(dat)
	if err != nil {
		return err
	}

	indexData := newIndexData(dat, lineups, time.Now())
	err = indexTmpl.renderIndex(w, indexData)
	if err != nil {
		return err
	}

	return nil
}
