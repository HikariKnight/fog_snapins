#!/bin/bash
# Download the newest chrome installer
curl -o /tmp/googlechrome.dmg https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg

# Mount the dmg file
hdiutil attach /tmp/googlechrome.dmg

# Copy Google Chrome to Applications
rsync -aPuv --delete "/Volumes/Google Chrome/Google Chrome.app" /Applications/

# Unmount the dmg file and remove it
hdiutil unmount "/Volumes/Google Chrome/"
rm /tmp/googlechrome.dmg
