#!/bin/bash
###
# A comma separated list of AD groups that should have admin rights
ADMIN_GROUPS="Enterprise Admins,Domain Admins,GPO Local Admin"
###

dsconfigad -groups "$ADMIN_GROUPS"