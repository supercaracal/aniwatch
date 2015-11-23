# Aniwatch2

## これは何？

私が視聴しているテレビ番組表。3ヶ月ごとに更新。

## 開発

### 初期構築

```
$ git clone git@github.com:supercaracal/aniwatch2.git
```

```
$ bundle install --path=.bundle
```

```
$ bin/rake db:create
$ bin/rake db:migrate
$ bin/rake db:seed
```

```
$ bin/rails s -b 0.0.0.0
```

### 継続開発

```
$ bundle exec guard
```

## CIステータス

[![Build Status](https://travis-ci.org/supercaracal/aniwatch2.svg?branch=master)](https://travis-ci.org/supercaracal/aniwatch2)
