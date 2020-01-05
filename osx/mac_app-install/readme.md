# Mac App Install
This script serves the function of working as an app installer for OSX clients as long as you have the DMG or PKG file for the program.

All the files and folders in the smb folder are meant as examples and are supposed to contain their corresponding DMG and PKG files.

When you run the mac_app-install.sh snapin through fog with the parameter "chrome" it will mount its configured (in the script) smb share and run the install.sh file which is located inside the chrome folder.
This install.sh file then downloads and installs the latest version of Google Chrome.

For programs whose downloaded filenames might change over time, you can supply the files inside the folder and tell the install.sh script to use those instead, making you able to keep a local repository of programs for your Mac clients.

The mac_app-install.sh script also lets you install multiple programs at once by just supplying more names like

`/bin/bash mac_app-install.sh chrome krita gimp`