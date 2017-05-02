#!/bin/bash

export DISABLE_DATABASE_ENVIRONMENT_CHECK=1
export RAILS_ENV=production
export SECRET_KEY_BASE=$(bin/rails secret)

readonly DISABLE_LOG='Rails.logger.level = 5'
readonly FETCH_HTML='Rails.application.call("REQUEST_METHOD" => "GET", "rack.input" => "").third.each { |b| puts b }'
readonly RAILS_CMD="${DISABLE_LOG}; ${FETCH_HTML}"

bin/rails db:setup

mkdir -p docs
rm docs/*

bin/rails assets:precompile
mv public/assets/* docs/

bin/rails runner "$RAILS_CMD" | sed -e 's#/assets/#/aniwatch/#g' > docs/index.html
