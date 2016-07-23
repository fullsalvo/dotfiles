#!/bin/sh

xmodmap ~/.xmodmaprc

# Stupid font things
xset +fp /home/fullsalvo/.fonts
xset fp rehash

# Make X Terminal Emulator terms not ugly
xrdb ~/.Xresources

# Load into a wm
defaultwm=i3
case "$1" in
	*)
		exec $defaultwm ;;
esac
exec compton
