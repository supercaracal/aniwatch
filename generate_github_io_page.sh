#!/bin/bash

DISABLE_DATABASE_ENVIRONMENT_CHECK=1 RAILS_ENV=production bin/rails db:setup

mkdir -p docs
rm docs/*

fetch_html="Rails.logger.level = 5; Rails.application.call('REQUEST_METHOD' => 'GET', 'rack.input' => '').third.each { |b| puts b }.first"
RAILS_ENV=production SECRET_KEY_BASE=$(bin/rails secret) bin/rails runner "$fetch_html" | sed -e 's#/assets/#/aniwatch/#g' > docs/index.html

bin/rails assets:precompile
mv public/assets/* docs/
