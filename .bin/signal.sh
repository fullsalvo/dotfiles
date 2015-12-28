#!/bin/bash
# fullsalvo's signal strength block

network=$(iwgetid -r)

if [[ $network == "" ]]; then
    exit 0
else
    signal=$(nmcli dev wifi | grep $network)
fi

echo $signal
