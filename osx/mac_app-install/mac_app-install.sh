#!/bin/bash
# This user should only have read and execute permissions for the share
# It is also important that this user should have no other permissions for
# ANYTHING else
# You can also rewrite the script to use curl to fetch scripts from a website too
SMBUSER="fog"
SMBPW="apassword"

# Settings for the share
SERVER="nas.domain.local"
SHARE="mac_apps"


# If we have a program to install
if [[ $# -gt 0 ]]
  then
    # Mount the share containing all the mac files
    mkdir /tmp/fog
    mount_smbfs "smb://$SMBUSER:$SMBPW@$SERVER/$SHARE" /tmp/fog

    # Iterate over all passed program names
    for app in "$@"
    do
      # Tell what we are doing
      echo "Installing App: $app"
      # Run its installer script
      bash /tmp/fog/$app/install.sh
    done
    
    # Unmount the share and cleanup
    umount /tmp/fog
    rmdir /tmp/fog
fi
