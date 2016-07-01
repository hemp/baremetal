#!/bin/bash

PARENT_DIRECTORY="$(dirname "$(pwd)")"

apm list --installed --bare > atom-packages
