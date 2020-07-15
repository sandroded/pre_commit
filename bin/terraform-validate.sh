#!/bin/bash

set -e

for dir in $(echo "$@" | xargs -n1 dirname | sort -u | uniq); do
  pushd "$dir" >/dev/null
  terraform init -backend=false
  terraform validate
  popd >/dev/null
done