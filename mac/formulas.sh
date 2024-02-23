#!/bin/bash

# install http://brew.sh/ and formulas

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"
brew update
brew analytics off
brew tap homebrew/bundle
brew bundle install --file=../common/Brewfile

cp vscode-settings.json $HOME/Library/Application\ Support/Code/User/settings.json
$(brew --prefix)/opt/fzf/install

brew cleanup
