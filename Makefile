USE_PKGBUILD=1
include /usr/local/share/luggage/luggage.make
TITLE=computer_name
REVERSE_DOMAIN=com.mikesolin
PACKAGE_VERSION=1.0
PAYLOAD=\
	pack-script-preinstall\
	pack-usr-local-bin-computer_name.sh\
	pack-Library-LaunchDaemons-com.mikesolin.computer_name.plist\
	pack-script-postinstall

munkiimport: dmg
		munkiimport \
--nointeractive \
--subdirectory scripts \
--name "${TITLE}" \
--displayname "Computer Name" \
--description "Prevents Munki breakage if the computer is renamed." \
--category "Scripts" \
--developer "Mike Solin" \
--minimum_os_version "10.5.0" \
--unattended_install \
"${DMG_NAME}"