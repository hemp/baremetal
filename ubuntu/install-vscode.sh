#!/bin/bash

wget -q https://go.microsoft.com/fwlink/?LinkID=760868 -O /tmp/vscode-latest.deb
sudo dpkg -i /tmp/vscode-latest.deb
sudo apt-get install -f # Install dependencies

