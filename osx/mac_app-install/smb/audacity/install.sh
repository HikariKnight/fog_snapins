#!/bin/bash
DMG="audacity-macos-2.3.3"
VOL="Audacity 2.3.3"
APP="audacity"
NAME="audacity"
PKGS=(ffmpeg_64bit_osx lame_64bit_osx)

# Install the pkg files
mkdir /tmp/pkg_installer
for pkg in "${PKGS[@]}"
do
    # Copy the pkg to a local folder on the OSX client
    # as the .pkg files cannot run from a network share
    rsync -aPuv /tmp/fog/$NAME/$pkg.pkg /tmp/pkg_installer/
    installer -pkg /tmp/pkg_installer/$pkg.pkg -target /
done
rmdir /tmp/pkg_installer

# Mount dmg and install app to /Applications
hdiutil mount /tmp/fog/$NAME/$DMG.dmg
rsync -aPuv --delete "/Volumes/$VOL/$APP.app" /Applications/

# Unmount dmg
hdiutil unmount "/Volumes/$VOL/"
