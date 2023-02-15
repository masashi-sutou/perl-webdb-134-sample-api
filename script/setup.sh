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
  echo "--- please install carton ---"
  exit 1
fi

cpm install --show-build-log-on-failure
cpm install -g --show-build-log-on-failure Perl::Tidy Perl::Critic Perl::Critic::Policy::Perlsecret
plenv rehash
