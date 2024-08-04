#!/bin/bash

# configure runtimes

asdf install nodejs latest
asdf install yarn 1.22.19
# https://github.com/pyenv/pyenv/wiki#suggested-build-environment
# brew install openssl readline sqlite3 xz zlib tcl-tk
asdf install python latest
asdf install rust latest
# asdf plugin-add direnv

# corepack enable
# corepack prepare pnpm@latest --activate
# asdf reshim nodejs

# Set global versions
asdf global nodejs latest
asdf global yarn 1.22.19
asdf global python latest
asdf global rust latest
# asdf global java latest:corretto-11

# omz plugin instead
# asdf direnv setup --shell zsh --version system
