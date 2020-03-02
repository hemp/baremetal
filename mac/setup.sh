#!/bin/bash

PARENT_DIRECTORY="$(dirname "$(pwd)")"

#-------------------------------------------------------------------------------
# install http://brew.sh/

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update

#-------------------------------------------------------------------------------
# install brew kegs

brew install ack
brew install coreutils
brew install curl
brew install dockutil
brew install htop
brew install lynx
brew install nmap
brew install wget

brew install exiftool
brew install faac
brew install flac
brew install ffmpeg
brew install ffmpeg2theora
brew install imagemagick
brew install lame
brew install sox
brew install x264
brew install xvid

brew install git
brew install mercurial
brew install git-cal
brew install git-cola
brew install icdiff
brew install kdiff3

brew install nginx

brew install node
brew install watchman

brew install awscli

brew install macvim
brew install reattach-to-user-namespace
brew install tmux

brew install youtube-dl

brew install weechat --with-python --with-perl

brew install ievms

#-------------------------------------------------------------------------------
# install brew casks

apps=(
    atom
    calibre
    cord
    filezilla
    firefox
    firefoxdeveloperedition
    gfxcardstatus
    google-chrome
    google-chrome-canary
    grandperspective
    handbrake
    imagealpha
    imageoptim
    inkscape
    iterm2
    licecap
    minecraft
    nvalt
    obs
    reggy
    safari-technology-preview
    slack
    sourcetree
    spectacle
    sublime-text3
    the-unarchiver
    tunnelblick
    virtualbox
    visual-studio-code
    vlc
    wireshark
    xquartz
    zoomus
    zoomus-outlook-plugin
)

brew cask install --appdir="/Applications" ${apps[@]}

#-------------------------------------------------------------------------------
# install yadr - https://github.com/skwp/dotfiles

sh -c "`curl -fsSL https://raw.githubusercontent.com/skwp/dotfiles/master/install.sh`"

#-------------------------------------------------------------------------------
# apply mac os x preferences

sh ~/.yadr/bin/macos
sh osx.sh

#-------------------------------------------------------------------------------
# install atom packages

apm install --packages-file $PARENT_DIRECTORY/common/atom-packages

#-------------------------------------------------------------------------------
# install node packages

npm -g install n
n latest

npm -g install git-stats npm-check-updates

#-------------------------------------------------------------------------------
# clean up

sh dock.sh

brew cleanup
brew cask cleanup
