#!/usr/bin/env bash

set -u

if ! (type perltidy >/dev/null 2>&1); then
  echo "--- please install perltidy: [cpm install -g Perl::Tidy] ---"
  exit 1
fi

find lib -type f -name "*.pm" -print0 | xargs -0 perltidy -b
find etc -type f -name "*.pl" -print0 | xargs -0 perltidy -b
find t -type f \( -name "*.t" -or -name "*.pm" \) -print0 | xargs -0 perltidy -b

## bakファイルを最後に削除する
find . -name "*.bak" -type f -delete
