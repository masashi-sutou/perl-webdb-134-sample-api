#!/usr/bin/env bash

set -euo pipefail

if ! (type perlcritic >/dev/null 2>&1); then
  echo "--- please install perlcritic: [cpm install -g Perl::Critic Perl::Critic::Policy::Perlsecret] ---"
  exit 1
fi

perlcritic --quiet etc/ lib/ t/
