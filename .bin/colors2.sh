#!/bin/bash
# Prints terminal colors as blocks in a line
# Only works with terminals that use .Xdefaults/.Xresources
#
# Created by Dylan Araps
# https://github.com/dylanaraps/dotfiles

# Add linebreak above colors
echo

number=-1

eight () {
    for color in $(xrdb -query | awk '/*.color[1-8]:/ {print $2}'); do
        number=$((number + 1))
        echo -n "$(tput setaf "$number")$(tput smso)       $(tput sgr0)"
    done
}

nine () {
    for color in $(xrdb -query | awk '/*.color[1-9]:/ {print $2}'); do
        number=$((number + 1))
        echo -n "$(tput setaf "$number")$(tput smso)       $(tput sgr0)"
    done
}

sixteen () {
    for color in $(xrdb -query | grep "\*\.color[0-9]*[0-9]:" | sort --version-sort | cut -f2); do
        number=$((number + 1))

        # Split the line when we hit the ninth color
        if [ $number -eq 8 ]; then
            echo
        fi

        echo -n "$(tput setaf "$number")$(tput smso)       $(tput sgr0)"
    done
}

case $1 in
    8) eight ;;
    9) nine ;;
    16) sixteen ;;
    *) number=0; $2 eight;;
esac

# Add linebreak below colors
echo
echo
