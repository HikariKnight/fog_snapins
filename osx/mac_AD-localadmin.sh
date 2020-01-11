#!/bin/bash
###
# A comma separated list of AD groups that should have admin rights
ADMIN_GROUPS="Enterprise Admins,Domain Admins,GPO Local Admin"
###

# Enable mobile accounts (offline caching) and apply local admin groups
dsconfigad -mobile enable -groups "$ADMIN_GROUPS"