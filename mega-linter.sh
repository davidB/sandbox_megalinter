#! /usr/bin/env bash

set -euo pipefail
# set -x
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
docker run --pull always --rm -it -v /var/run/docker.sock:/var/run/docker.sock:rw -v "${SCRIPT_DIR}:/tmp/lint:rw" -e "VALIDATE_ALL_CODEBASE:true" megalinter/megalinter-rust:v5
