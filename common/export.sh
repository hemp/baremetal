#!/bin/bash

# git config
cp ~/.gitconfig gitconfig
cp ~/.gitignore_global gitignore_global

# vscode settings
cp ~/Library/Application\ Support/Code/User/settings.json vscode-settings.json
# code --list-extensions | xargs -L 1 echo code --install-extension > vscode-extensions.sh

# Brewfile
brew bundle dump
