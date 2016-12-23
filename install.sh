#!/bin/bash

#
# Find our dir reguardless of where this repo is checked out from.
# E.g. /home/username/.dotfiles
#
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

#
# Also get the host in case we have overrides
#
HOST=$( hostname )

#
# Util functions
#
backup_config() {
	# Remove symlinks to nowhere
	[ -L "$HOME/$2" -a ! -f "$HOME/$2" ] && rm "$HOME/$2"

	# Backup files and dirs
	[ -f "$HOME/$2" -o -d "$HOME/$2" ] && mv -f "$HOME/$2" "$DIR/backups/$2"
}

link_config() {
	ln -s "$1/$2" "$HOME/$2"
}

install_config_dir() {
	# Link all that we have from checked in configs
	for DOTFILE in $( ls -A "$1" )
	do
		backup_config "$1" "$DOTFILE"
		link_config "$1" "$DOTFILE"
	done
}

#
# Install dotfiles
#

# Clear out backup dir
mkdir -p "$DIR/backups"
rm -rf "$DIR/backups/*"

# Link all that we have from checked in configs (global)
install_config_dir "$DIR/configs"

# Link from host override configs
[ -d "$DIR/configs-host/$HOST" ] && install_config_dir "$DIR/configs-host/$HOST"

