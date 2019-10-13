#!/bin/bash

yarn install --check-files
bin/rails db:setup
