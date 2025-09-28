<!doctype html>
<html lang="ja" data-bs-theme="dark">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>{{.Title}}</title>
  <link rel="shortcut icon" type="image/x-icon" href="/{{.Data.AppName}}/favicon.ico" />
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
  <script src="/aniwatch/script.js"></script>
</head>
<body>
  <nav class="navbar fixed-top bg-body-tertiary">
    <div class="container-fluid">
      <span class="navbar-brand mb-0 h1">{{.Title}}</span>
    </div>
  </nav>
  <div class="container-fluid">
    <div class="row my-5 pt-4 pb-3 px-2">
      <div class="col-md-12">
        <table class="table table-bordered">
          <thead>
            <tr>
              <th>
                <button type="button" class="btn btn-dark btn-sm position-relative" id="counter">
                  Like
                  <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill text-bg-light">
                    {{.LineupCount}}
                  </span>
                </button>
              </th>
              {{range .Data.SlotOfDay}}
                <th scope="col">
                  <span class="badge text-bg-{{.Color}}">{{.Name}}</span>
                </th>
              {{end}}
            </tr>
          </thead>
          <tbody>
            {{range .Data.DayOfWeek}}
              <tr>
                <th scope="row"><span class="badge text-bg-secondary">{{.Name}}</span></th>
                {{with $slots := index $.LineupsPerDaySlot .ID}}
                  {{range $.Data.SlotOfDay}}
                    <td>
                      {{with $lineups := index $slots .ID}}
                        <ul class="list-unstyled">
                          {{range $lineups}}
                            <li>
                              <strong>{{.Title}}</strong>
                              <span class="text-body-secondary">
                                {{.Start}}&nbsp;{{.Channel}}
                              </span>
                            </li>
                          {{end}}
                        </ul>
                      {{else}}
                        <span class="text-body-secondary">--</span>
                      {{end}}
                    </td>
                  {{end}}
                {{end}}
              </tr>
            {{end}}
          </tbody>
        </table>
      </div>
    </div>
  </div>
  <nav class="navbar fixed-bottom bg-body-tertiary">
    <div class="container-fluid justify-content-center">
      <span class="navbar-text">
        {{.Quarter}}
        &nbsp;
        <a href="https://github.com/{{.Data.AuthorID}}/{{.Data.AppName}}">{{.Data.AuthorName}}</a>
      </span>
    </div>
  </nav>
</body>
