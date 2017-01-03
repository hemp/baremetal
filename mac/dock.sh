#!/bin/bash

DOCKUTIL=/usr/local/bin/dockutil

$DOCKUTIL --remove all --no-restart
$DOCKUTIL --add '/Applications/Google Chrome.app' --no-restart
$DOCKUTIL --add '/Applications/Safari.app' --no-restart
$DOCKUTIL --add '~/Downloads'
