#!/bin/bash

DISABLE_DATABASE_ENVIRONMENT_CHECK=1 RAILS_ENV=production bin/rails db:setup

mkdir -p docs
rm docs/*

disable_log='Rails.logger.level = 5'
fetch_html='Rails.application.call("REQUEST_METHOD" => "GET", "rack.input" => "").third.each { |b| puts b }'
rails_cmd="${disable_log}; ${fetch_html}"
SECRET_KEY_BASE=$(bin/rails secret) bin/rails runner -e production "$rails_cmd" | sed -e 's#/assets/#/aniwatch/#g' > docs/index.html

bin/rails assets:precompile
mv public/assets/* docs/
