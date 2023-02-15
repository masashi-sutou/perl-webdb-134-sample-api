#!/usr/bin/env bash

set -euo pipefail

if ! (type plenv >/dev/null 2>&1); then
  echo "--- please install plenv ---"
  exit 1
fi

if ! (type cpm >/dev/null 2>&1); then
  echo "--- please install cpm ---"
  exit 1
fi

if ! (type carton >/dev/null 2>&1); then
  echo "--- please install carton: [cpm install -g Carton] ---"
  exit 1
fi

# cpanfileを状態をcpanfile.snapshotに反映させるには、localを削除しないといけない
rm -rf local/
cpm install --show-build-log-on-failure
carton install
plenv rehash
