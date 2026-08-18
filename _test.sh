#!/usr/bin/env bash

docker build -f lint.Dockerfile -t dotfiles-lint .
docker run --rm dotfiles-lint

docker build -t dotfiles-test .
docker run -it -v `pwd`:/root/.local/share/chezmoi dotfiles-test