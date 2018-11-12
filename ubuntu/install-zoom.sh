#!/bin/bash

wget -q https://zoom.us/client/latest/zoom_amd64.deb -O /tmp/zoom-latest.deb
sudo dpkg -i /tmp/zoom-latest.deb
