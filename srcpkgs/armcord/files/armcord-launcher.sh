#!/bin/sh

#
# Launcher script to launch Armcord using system electron instead of the bundled binary.
# This is not necessary on glibc, but I am on musl so I cannot use the prebuilt binary :)
#
# This script has been shamelessly "borrowed" from the Arch Linux AUR package "armcord-git" made by Vendicated, because there is no point in rewriting it by myself =D
# https://aur.archlinux.org/cgit/aur.git/tree/armcord-launcher.sh?h=armcord-git
#

electron="/usr/bin/electron19"

CONFIG="${XDG_CONFIG_HOME:-~/.config}"
FLAGS="${CONFIG}/armcord-flags.conf"

# Allow users to override command-line options
if [ -f "$FLAGS" ]; then
  USER_FLAGS="$(cat "$FLAGS")"
fi

# shellcheck disable=SC2086 # USER_FLAGS has to be unquoted
"$electron" /usr/share/armcord/app.asar $USER_FLAGS "$@"
