#!/usr/bin/env bash
# Name: irssi-notify
# Author: fullsalvo
# Uses dunstify to display notifications upon name highlight

DUNSTIFY_ID="/tmp/irssi-notify_dunstify_id"

# Get the dunstify id
[ ! -z "$(cat "$DUNSTIFY_ID")" ] && id_arg="-r $(cat "$DUNSTIFY_ID")"

$HOME/.bin/dunstify \
    -a "irssi"\
    -p $id_arg > "$DUNSTIFY_ID" \
    "You have been highlighted."
