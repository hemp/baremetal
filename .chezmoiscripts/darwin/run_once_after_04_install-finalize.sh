#!/bin/bash

echo "install-finalize:"

$HOME/.iterm2-color-schemes/tools/import-scheme.sh 'Tomorrow Night Bright'

# Remove binary used on fresh first install and defer to the version from: `brew install chezmoi`
rm -f $HOME/bin/chezmoi

# remove GateKeeper
# xattr -c -r /Applications/Alacritty.app
# xattr -c -r /Applications/iTerm.app
# xattr -c -r /Applications/Spotify.app
# xattr -c -r /Applications/WezTerm.app
