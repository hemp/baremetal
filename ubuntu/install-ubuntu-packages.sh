#!/bin/bash

apps=(
    audacious
    audacious-plugins
    build-essential
    chromium-browser
    conky-all
    curl
    diffuse
    firefox
    fonts-inconsolata
    git
    git-cola
    htop
    i3
    network-manager-openvpn
    network-manager-openvpn-gnome
    openvpn
    qgit
    rake
    ruby
    shutter
    silversearcher-ag
    tig
    vim
    vlc
    wget
    zsh
)

sudo apt-get --assume-yes install ${apps[@]}
