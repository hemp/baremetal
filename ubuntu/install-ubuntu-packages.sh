#!/bin/bash

apps=(
    audacious
    audacious-plugins
    build-essential
    chromium-browser
    conky-all
    curl
    diffuse
    git
    git-cola
    htop
    i3
    firefox
    fonts-inconsolata
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
