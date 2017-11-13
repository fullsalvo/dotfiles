#!/usr/bin/env bash

# Convenience
alias c='clear'
alias h='history'
alias aptin='sudo apt-get install'
alias upgrade='sudo apt-get update && sudo apt upgrade && sudo apt-get autoremove'
alias shutdown='poweroff'
alias apts='apt-cache search'
alias networks='nmcli dev wifi'
alias wifion='nmcli radio wifi on'
alias wifioff='nmcli radio wifi off'
alias commit='git commit -m "fullsalvo update"'
alias dir='pwd'
alias rm='rm -I'
alias ..="cd .."
alias unstow="stow -D"
alias x="startx"
alias fdisk="sudo fdisk"

# Research
alias abacus="ssh ddb19@abacus.cs.uwf.edu"

# Applications/Tools
alias fsch='feh -. --zoom fill -g 1280x720'
alias music='ncmpcpp'
alias cupd='xrdb ~/.Xresources'
alias scrot='maim --format png /home/fullsalvo/Pictures/Screenshots/$(date "+%y-%b-%d_%H%M%S").png -b 3 -n -c 0.4,0.4,0.4'
alias sprunge="curl -F 'sprunge=<-' http://sprunge.us"
alias mpv='mpv --geometry 1280x720'

# Fun
alias hex='hex 16'
alias i3o='i3-msg open'

# Environment Variables
export WZK_ZNC_PASS="Sch00l"
export EDITOR="emacs -nw"
export XDG_MUSIC_DIR=$HOME/Music
export RHISK_COMM='zenbu'
# export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=gasp'
