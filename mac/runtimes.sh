#!/bin/bash

# configure runtimes

asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git

# asdf install nodejs latest
# asdf install nodejs latest:18

# corepack enable
# corepack prepare pnpm@latest --activate
# asdf reshim nodejs