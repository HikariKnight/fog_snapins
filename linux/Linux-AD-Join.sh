#!/bin/bash
##############################################################
### Remember to check the checkbox to either reboot or shutdown
### the host after running this snapin!
##############################################################
# Hide passwords from history
export HISTIGNORE="echo *"
##############################################################
### CONFIG
ADJOIN_USER="fog"
DOMAIN_FQDN="domain.local"

# Local System account
SYSUSR="sysadm"
XSESSION="gnome"

# Polkit gpo bypasses gui password prompts without giving full sudo access
POLKIT_GPO="gpo local admin"

# sudo gpo gives full sudo access if the device has the group
# this is useful if you want to limit sudo access to certain devices with this group added to sudoers
# while using an AD group named "sudo" as the global sudo access group across all devices
SUDO_GPO="gpo unix admin"

# Add sudo GPO for use with users that should not have sudo access across all decives in the domain
# In order to give global sudo access across all unix devices, add the users to an AD group named sudo
# Comment out the line below to require the users to be in the AD group named sudo in order to get sudo access
echo "'%$SUDO_GPO'  ALL=(ALL) ALL" | tee /etc/sudoers.d/gpo_localadmin

# DO NOT PUT THIS PASSWORD IN VARIABLES!
echo "domainpassword" | realm join -U $ADJOIN_USER $DOMAIN_FQDN
### END OF CONFIG
##############################################################

# Hide $SYSUSR user from the login screen
printf "[User]\nLanguage=\nXSession=$XSESSION\nSystemAccount=true\n" | tee /var/lib/AccountsService/users/$SYSUSR

# AD local admin GPO integration (this only affects polkit, for full admin access the user must be in sudo group too)
printf "[AD Integration]\nIdentity=unix-group:$POLKIT_GPO\nAction=*\nResultActive=yes\n" | tee /var/lib/polkit-1/localauthority/20-org.d/ad-integration.pkla

# Disable authentication with FQDN (remove the need for @birralee.local when logging in)
sed -i "/use_fully_qualified_names = True/c\use_fully_qualified_names = False" /etc/sssd/sssd.conf
