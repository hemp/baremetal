#!/bin/bash

PARENT_DIRECTORY="$(dirname "$(pwd)")"

#-------------------------------------------------------------------------------
# apply ubuntu packages

bash install-ubuntu-packages.sh

#-------------------------------------------------------------------------------
# install yadr - https://github.com/skwp/dotfiles

#sh -c "`curl -fsSL https://raw.github.com/skwp/dotfiles/master/install.sh`"

#-------------------------------------------------------------------------------
# install apps

bash install-atom.sh
bash install-vscode.sh
bash install-zoom.sh

#-------------------------------------------------------------------------------
# install editor packages/extensions

apm install --packages-file $PARENT_DIRECTORY/common/atom-packages
bash $PARENT_DIRECTORY/common/vscode-extensions.sh

#-------------------------------------------------------------------------------
# install node

bash install-node.sh

#-------------------------------------------------------------------------------
# install docker

bash install-docker.sh

sudo apt-get clean
