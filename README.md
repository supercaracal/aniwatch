# Aniwatch

[![Build Status](https://travis-ci.org/supercaracal/aniwatch.svg?branch=master)](https://travis-ci.org/supercaracal/aniwatch)
[![Maintainability](https://api.codeclimate.com/v1/badges/5350f530cb680886b748/maintainability)](https://codeclimate.com/github/supercaracal/aniwatch/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/5350f530cb680886b748/test_coverage)](https://codeclimate.com/github/supercaracal/aniwatch/test_coverage)
[![Issue Count](https://codeclimate.com/github/supercaracal/aniwatch/badges/issue_count.svg)](https://codeclimate.com/github/supercaracal/aniwatch/issues)

This is my weekly television schedule. It is updated every three months.

## Development

```
$ git clone https://github.com/supercaracal/aniwatch.git
```

```
$ bin/bundle install --path=.bundle
```

```
$ bin/rails db:prepare
```

```
$ bin/rails s -b 0.0.0.0
```

```
$ bin/guard
```

## Production

```
$ bash generate_github_pages.sh
```
