#!/bin/bash
DMG="gimp-2.10.14-x86_64"
VOL="GIMP 2.10 Install"
APP="GIMP-2.10"
NAME="gimp"

# Mount dmg and install app to /Applications
hdiutil mount /tmp/fog/$NAME/$DMG.dmg
rsync -aPuv --delete "/Volumes/$VOL/$APP.app" /Applications/

# Unmount dmg
hdiutil unmount "/Volumes/$VOL/"
