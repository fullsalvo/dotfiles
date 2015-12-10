#!/usr/bin/env bash

icon="$HOME/.xlock/lock-icon.png"
tmpbg='/tmp/screen.png'

(( $# )) && { icon=$1; }

scrot "$tmpbg"
convert "$tmpbg" -scale 10% -scale 1000% "$tmpbg"
convert "$tmpbg" "$icon" -gravity center -composite -matte "$tmpbg"
mpc pause
i3lock -u -i "$tmpbg"
rm "$tmpbg"

##!/bin/bash
#scrot /tmp/screen.png
#convert /tmp/screen.png -scale 10% -scale 1000% /tmp/screen.png
#[[ -f $1 ]] && convert /tmp/screen.png $1 -gravity center -composite -matte /tmp/screen.png
#mpc pause
#i3lock -u -i /tmp/screen.png
#rm /tmp/screen.png
