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
	data   *data.Data
	logger *config.Logger
	tmpl   *tmplobj
}

// NewController is
func NewController(dat *data.Data, logger *config.Logger) (*Controller, error) {
	tmpl, err := newTemplate()
	if err != nil {
		return nil, err
	}

	return &Controller{
		data:   dat,
		logger: logger,
		tmpl:   tmpl,
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

func (ctrl *Controller) index(w http.ResponseWriter, _ *http.Request) {
	lineups, err := makeLineupsPerDaySlot(ctrl.data)
	if err != nil {
		ctrl.logger.Err.Println(fmt.Errorf("failed to make lineups: %w", err))
		http.Error(w, "failed to make lineups", http.StatusInternalServerError)
		return
	}

	indexData := newIndexData(ctrl.data, lineups, time.Now())

	if err := ctrl.tmpl.render(w, "index", indexData); err != nil {
		ctrl.logger.Err.Println(fmt.Errorf("failed to render html file: index: %w", err))
		http.Error(w, "failed to render html file", http.StatusInternalServerError)
	}
}
