#!/bin/bash

PARENT_DIRECTORY="$(dirname "$(pwd)")"

#-------------------------------------------------------------------------------
# apply mac os x preferences
sh osx.sh

#-------------------------------------------------------------------------------
# install xcode command line tools
xcode-select --install

#-------------------------------------------------------------------------------
# install http://brew.sh/
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update

#-------------------------------------------------------------------------------
# install brew cask - http://caskroom.io/

brew install caskroom/cask/brew-cask
brew tap caskroom/versions

#-------------------------------------------------------------------------------
# install yadr - https://github.com/skwp/dotfiles
sh -c "`curl -fsSL https://raw.github.com/skwp/dotfiles/master/install.sh`"
sh update-yadr.sh

#-------------------------------------------------------------------------------
# install brew kegs

brew install ack
brew install coreutils
brew install curl
brew install htop-osx
brew install lynx
brew install nmap
brew install wget

brew install exiftool
brew install faac
brew install ffmpeg
brew install ffmpeg2theora
brew install imagemagick
brew install lame
brew install sox
brew install x264
brew install xvid

brew install git
brew install mercurial
brew install git-cola
brew install icdiff
brew install kdiff3

brew install haproxy
brew install nginx

brew install node
brew install nvm
brew install phantomjs
brew install watchman

brew install awscli

brew install macvim
brew install reattach-to-user-namespace
brew install tmux

# brew install java
# brew install maven

brew install youtube-dl

brew install weechat --with-python --with-perl

#-------------------------------------------------------------------------------
# install brew casks

apps=(
    atom
    audacity
    brackets
    calibre
    coconutbattery
    cord
    disk-inventory-x
    filezilla
    firefox
    firefoxdeveloperedition
    flux
    gfxcardstatus
    gimp-lisanet
    github
    google-chrome
    google-chrome-canary
    handbrake
    imagealpha
    imageoptim
    inkscape
    iterm2
    minecraft
    nvalt
    obs
    reggy
    sourcetree
    spectacle
    sublime-text3
    synergy
    the-unarchiver
    virtualbox
    vlc
    wireshark
    xquartz
)

brew cask install --appdir="/Applications" ${apps[@]}

#-------------------------------------------------------------------------------
# install atom packages
apm install --packages-file $PARENT_DIRECTORY/common/atom-packages

#-------------------------------------------------------------------------------
# install node packages
npm -g install bower npm-check-updates

#-------------------------------------------------------------------------------
# clean up
brew cleanup
brew cask cleanup
