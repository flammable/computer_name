# computer_name

### What is this?

This is a script and LaunchDaemon that watches for the `computer name` field to be changed, then writes that to Munki's `ClientIdentifier` field.

Originally, I was overriding the `HostName` field (then using that to identify Macs to Munki), but Greg Neagle pointed out that this was not a great idea. This script is better!

### Requirements

You'll need [Munki](https://github.com/munki/munki) for this to actually be useful. If you want to build the pkg, put [munkipkg](https://github.com/munki/munki-pkg) in `/usr/local/munki-pkg`.

### How do I use this?

`cd` into the `computer_name` directory, then run `munkiimport.sh` to build the pkg and import it into your Munki repo.