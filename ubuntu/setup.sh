#!/bin/bash

PARENT_DIRECTORY="$(dirname "$(pwd)")"

#-------------------------------------------------------------------------------
# apply ubuntu packages

apps=(
    audacious
    audacious-plugins
    build-essential
    chromium
    curl
    diffuse
    git
    htop
    i3
    firefox
    fonts-inconsolata
    nodejs
    npm
    qgit
    rake
    ruby
    silversearcher-ag
    shutter
    tig
    wget
    vim
    vlc
    zsh
)

sudo apt-get --assume-yes install ${apps[@]}

#-------------------------------------------------------------------------------
# install yadr - https://github.com/skwp/dotfiles

#sh -c "`curl -fsSL https://raw.github.com/skwp/dotfiles/master/install.sh`"

#-------------------------------------------------------------------------------
# install atom

sh install-atom.sh

#-------------------------------------------------------------------------------
# install atom packages

apm install --packages-file $PARENT_DIRECTORY/common/atom-packages

#-------------------------------------------------------------------------------
# install node packages

source ~/.profile

sudo chown -R $(whoami) /usr/local #$(npm config get prefix)
npm -g install bower git-stats n npm-check-updates
n lts

sudo apt-get clean
