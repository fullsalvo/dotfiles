#!/bin/bash
# fullsalvo's signal strength block

network=$(iwgetid -r)

if [[ $network == "" ]]; then
    exit 0
else
    #signal=$(nmcli dev wifi | grep $network)
    signal=$(cat /proc/net/wireless | awk 'NR==3' | awk '{ print $3 }' | tr -d '.')
#    percentage=$(bc $signal / 70 * 100 | awk '{ print $1 }' | tr -d '~')
#    whole=$(echo $percentage | grep -Eo '[0-9]{1,3}' | awk NR==1)
fi

echo $signal/70
