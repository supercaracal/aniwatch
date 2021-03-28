package lineup

import (
	"fmt"
	"net/http"
	"time"

	"github.com/supercaracal/aniwatch/internal/config"
	"github.com/supercaracal/aniwatch/internal/data"
)

// Controller is
type Controller struct {
	data      *data.Data
	logger    *config.Logger
	indexTmpl *viewTmpl
}

// NewController is
func NewController(dat *data.Data, logger *config.Logger, rootDir string) (*Controller, error) {
	indexTmpl, err := newIndexTemplate(rootDir)
	if err != nil {
		return nil, err
	}

	return &Controller{
		data:      dat,
		logger:    logger,
		indexTmpl: indexTmpl,
	}, nil
}

// Exec is
func (ctrl *Controller) Exec(w http.ResponseWriter, r *http.Request) {
	if r.Method == http.MethodGet {
		ctrl.index(w, r)
		return
	}

	http.NotFound(w, r)
}

func (ctrl *Controller) index(w http.ResponseWriter, r *http.Request) {
	lineups, err := buildLineupsPerDaySlot(ctrl.data)
	if err != nil {
		ctrl.logger.Err.Println(fmt.Errorf("Failed to build lineups: %w", err))
		responseInternalServerError(w)
		return
	}

	indexData := newIndexData(ctrl.data, lineups, time.Now())
	if err := ctrl.indexTmpl.render(w, indexData); err != nil {
		ctrl.logger.Err.Println(fmt.Errorf("Failed to render html file (%s): %w", ctrl.indexTmpl.path, err))
		responseInternalServerError(w)
	}
}

func responseInternalServerError(w http.ResponseWriter) {
	msg := fmt.Sprintf("%d internal server error", http.StatusInternalServerError)
	http.Error(w, msg, http.StatusInternalServerError)
}
