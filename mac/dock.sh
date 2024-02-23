#!/bin/bash

# rid dock of noise

DOCKUTIL=/opt/homebrew/bin/dockutil

$DOCKUTIL --remove all --no-restart
$DOCKUTIL --add '/Applications/Firefox.app' --no-restart
$DOCKUTIL --add '~/Downloads'
