#!/bin/bash
DMG="krita-4.2.8"
VOL="krita"
APP="krita"
NAME="krita"

# Mount dmg and install app to /Applications
hdiutil mount /tmp/fog/$NAME/$DMG.dmg
cp -rf "/Volumes/$VOL/$APP.app" /Applications/

# Unmount dmg
hdiutil unmount "/Volumes/$VOL/"
