#!/bin/bash
DMG="audacity-macos-2.3.3"
VOL="Audacity 2.3.3"
APP="audacity"
NAME="audacity"
PKGS=(ffmpeg_64bit_osx lame_64bit_osx)

# Install ffmpeg and libmp3lame
mkdir /tmp/pkg_installer
ls /tmp/fog/$NAME
for pkg in "${PKGS[@]}"
do
    rsync -aPuv /tmp/fog/$NAME/$pkg.pkg /tmp/pkg_installer/
    #installer -pkg /tmp/pkg_installer/$pkg.pkg -target /
done
rmdir /tmp/pkg_installer

# Mount dmg and install app to /Applications
hdiutil mount /tmp/fog/$NAME/$DMG.dmg
rsync -aPuv --delete "/Volumes/$VOL/$APP.app" /Applications/

# Unmount dmg
hdiutil unmount "/Volumes/$VOL/"
