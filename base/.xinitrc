#!/bin/sh

# Stupid font things
xset +fp /home/fullsalvo/.fonts
xset fp rehash

# Java Options
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=gasp'

# Make X Terminal Emulator terms not ugly
xrdb ~/.Xresources

# MPD
mpd
mpdscribble

# Load into a wm
defaultwm=/usr/bin/i3
case "$1" in
	*)
		exec $defaultwm ;;
esac
