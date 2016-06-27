# computer_name

### What is this?

This is a script and LaunchDaemon that watches for the `computer name` field to be changed, then writes that to Munki's `ClientIdentifier` field.

Originally, we were overriding the `HostName` field (then using that to identify Macs to Munki), but Greg Neagle pointed out that this was not a great idea. This script is better!

### Requirements

Without modification, you'll need [Munki](https://github.com/munki/munki) and [The Luggage](https://github.com/unixorn/luggage) to use this. If you're comfortable building the package yourself, you can skip The Luggage requirement.

### How do I use this?

`cd` into the `computer_name` directory, then `make munkiimport`. Enter your password. This will create a PKG, wrap it in a DMG, then import it into your Munki repository. Enjoy!