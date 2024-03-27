#!/usr/bin/env bash

/usr/bin/chezmoi init --apply -v \
  && echo '--> chezmoi done' \
  && /bin/zsh