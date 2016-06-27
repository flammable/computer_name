#!/bin/bash

defaults="/usr/bin/defaults"
scutil="/usr/sbin/scutil"

COMPUTERNAME=$(${scutil} --get ComputerName)

${defaults} write /Library/Preferences/ManagedInstalls ClientIdentifier "${COMPUTERNAME}"

exit
