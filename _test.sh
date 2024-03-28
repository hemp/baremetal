#!/usr/bin/env bash

docker build -t dotfiles-test .
docker run -it -v `pwd`:/root/.local/share/chezmoi dotfiles-test