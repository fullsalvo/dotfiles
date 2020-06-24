#!/usr/bin/env bash

# Convenience
alias c='clear'
alias h='history'
alias shutdown='poweroff'
alias apts='apt-cache search'
alias nws='nmcli dev wifi'
alias wifion='nmcli radio wifi on'
alias wifioff='nmcli radio wifi off'
alias rm='rm -I'
alias unstow="stow -D"
alias fdisk="sudo fdisk"
alias ipython="ipython3"
alias vim="emacs -nw" # because I'm an idiot
alias inspect-viv="vivaldi-stable --debug-packed-apps --silent-debugger-extension-api"
alias git-diff="git diff --cached && git diff"

# Applications/Tools
alias fsch='feh -. --zoom fill -g 1280x720'
alias music='ncmpcpp'
alias cupd='xrdb ~/.Xresources'
alias scrot='maim --format png /home/fullsalvo/Pictures/Screenshots/$(date "+%y-%b-%d_%H%M%S").png -b 3 -n -c 0.4,0.4,0.4'
alias sprunge="curl -F 'sprunge=<-' http://sprunge.us"
alias mpv='mpv --geometry 1280x720'

# Environment Variables
export EDITOR="emacs -nw"
export XDG_MUSIC_DIR=$HOME/music
export XDG_DOWNLOAD_DIR=$HOME/downloads
export XDG_PICTURES_DIR=$HOME/pictures
export XDG_VIDEOS_DIR=$HOME/videos
export XDG_DOCUMENTS_DIR=$HOME/documents
export GOPATH=$HOME/dev/go
export RHISK_COMM='zenbu'
export TERM='rxvt-unicode'
