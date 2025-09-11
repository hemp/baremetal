#!/bin/bash

# pre-load live wallpapers:
# /Library/Application Support/com.apple.idleassetsd/Customer/4KSDR240FPS/
git clone https://github.com/lejacobroy/aerials-downloader.git
cd aerials-downloader
/usr/bin/pip3 install -r requirements.txt
sudo /usr/bin/python3 app.py
