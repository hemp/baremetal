#!/bin/bash

PARENT_DIRECTORY="$(dirname "$(pwd)")"

#-------------------------------------------------------------------------------
# apply ubuntu packages

apps=(
    curl
    git
    fonts-inconsolata
    nodejs
    rake
    ruby
    silversearcher-ag
    wget
    vim
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

npm -g install bower git-stats n npm-check-updates
n lts

sudo apt-get clean
