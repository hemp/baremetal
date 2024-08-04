#!/bin/bash

# rid dock of noise

dockutil --remove all --no-restart
dockutil --add '/Applications/Firefox.app' --no-restart
dockutil --add '~/Downloads'
