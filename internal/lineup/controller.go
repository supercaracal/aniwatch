package lineup

import (
	"fmt"
	"net/http"
	"time"

	"github.com/supercaracal/aniwatch/internal/config"
	"github.com/supercaracal/aniwatch/internal/data"
)

// Lineup is
type Lineup struct {
	data      *data.Data
	logger    *config.Logger
	indexTmpl *viewTmpl
}

// NewController is
func NewController(data *data.Data, logger *config.Logger) (*Lineup, error) {
	indexTmpl, err := newIndexTemplate()
	if err != nil {
		return nil, err
	}

	return &Lineup{
		data:      data,
		logger:    logger,
		indexTmpl: indexTmpl,
	}, nil
}

// Index is
func (reso *Lineup) Index(w http.ResponseWriter, r *http.Request) {
	lineups, err := buildLineupsPerDaySlot(reso.data)
	if err != nil {
		reso.logger.Err.Println(fmt.Errorf("Failed to build lineups: %w", err))
		responseInternalServerError(w)
		return
	}

	indexData := newIndexData(reso, lineups, time.Now())
	err = reso.indexTmpl.renderIndex(w, indexData)
	if err != nil {
		reso.logger.Err.Println(fmt.Errorf("Failed to render html file (%s): %w", reso.indexTmpl.path, err))
		responseInternalServerError(w)
		return
	}
}

func responseInternalServerError(w http.ResponseWriter) {
	msg := fmt.Sprintf("%d internal server error", http.StatusInternalServerError)
	http.Error(w, msg, http.StatusInternalServerError)
}
