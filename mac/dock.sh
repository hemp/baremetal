#!/bin/bash

DOCKUTIL=/usr/local/bin/dockutil

$DOCKUTIL --remove all --no-restart
$DOCKUTIL --add '/Applications/Firefox.app' --no-restart
$DOCKUTIL --add '~/Downloads'
