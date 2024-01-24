#!/bin/bash

# Binaries
basename="/usr/bin/basename"
munkiimport="/usr/local/munki/munkiimport"
munkipkg="/usr/local/munki-pkg/munkipkg"
PlistBuddy="/usr/libexec/PlistBuddy"
rm="/bin/rm"

# Determine variables to make this script more generic
pkg_name="$(${basename} ${PWD})"
pkg_version="$(${PlistBuddy} -c 'print version' ./build-info.plist)"

# Delete stray .DS_Store file in /payload
# This fixes the error: The operation couldn’t be completed. Can't find "." in bom file
if [[ -e ./payload/.DS_Store ]]; then
 ${rm} ./payload/.DS_Store
fi

# Build the pkg
# Normally, we'd run `${munkipkg} .` but instead we're exporting Bom info to Bom.txt for Git tracking of permissions
# If building this package after running `git clone`, be sure to run `${munkipkg} --sync .` first
${munkipkg} --export-bom-info .

# Import the pkg into Munki
${munkiimport} \
--nointeractive \
--subdirectory scripts \
--name "${pkg_name}" \
--displayname "Computer Name" \
--description "Prevents Munki breakage if the computer is renamed." \
--category "Scripts" \
--developer "Mike Solin" \
--minimum_os_version "10.5.0" \
--unattended_install \
./build/"${pkg_name}"-"${pkg_version}".pkg

exit
