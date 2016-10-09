#!/bin/sh

# Stupid font things
xset +fp /home/fullsalvo/.fonts
xset fp rehash

# Make X Terminal Emulator terms not ugly
xrdb ~/.Xresources

# MPD
sleep 2 && (
	mpd
	mpdscribble
	$HOME/.bin/mpd-notify-daemon &
) &

# Load into a wm
defaultwm=i3
case "$1" in
	*)
		exec $defaultwm ;;
esac
