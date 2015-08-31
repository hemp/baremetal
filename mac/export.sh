#!/bin/bash

PARENT_DIRECTORY="$(dirname "$(pwd)")"

apm list --installed --bare > $PARENT_DIRECTORY/common/atom-packages
