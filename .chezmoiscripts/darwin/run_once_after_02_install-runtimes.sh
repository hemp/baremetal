#!/bin/bash

echo "install-runtimes:"

if command -v mise >/dev/null; then
  mise install
else
  echo "mise is missing!"
fi
