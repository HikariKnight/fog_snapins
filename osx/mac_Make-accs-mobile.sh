#!/bin/bash
###
EXCLUDEDACCS="(administrator|shared|sysadm)"
###
# Enable mobile ad accounts (offline caching of the account)
dsoconfigad -mobile enable

# For each user in /Users except excluded accounts
for user in `ls /Users | grep -ivP $EXCLUDEDACCS`; do
    # Convert the AD network accounts to mobile accounts
    /System/Library/CoreServices/ManagedClient.app/Contents/Resources/createmobileaccount -n ${user}
done