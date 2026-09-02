#!/bin/bash

set -euo pipefail

echo "install-runtimes:"

if command -v mise >/dev/null; then
  mise install
else
  echo "mise is missing!" >&2
  exit 1
fi
