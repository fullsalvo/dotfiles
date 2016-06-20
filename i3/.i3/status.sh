#!/bin/bash

# Color defs
BLACK="#222222"
RED="#e84f4f"
GREEN="#b7ce42"
BLUE="#66aabb"
MAGENTA="#b7416e"
CYAN="#6d878d"
WHITE="#dddddd"
LBLUE="#00FFFF"

process_json() {
  raw_json=$1
  button_name=$(echo ${raw_json} | jshon -e name)
  button_name=$(echo ${button_name} | sed 's/\"//g')
  click_type=$(echo ${raw_json} | jshon -e button)
  case $button_name in
    volume)
      /bin/bash ~/.bin/soundctrl ${click_type} &>/dev/null
      ;;
  esac
}

# send JSON header
echo '{ "version": 1, "click_events": true }'

# Begin an endless array
echo '['

# send empty blocks to make it simple
echo '[]'

#
# Send blocks with info forever
#
while :; do
  echo ",["
  # Status
    # Window Name
      echo '{'
      echo "\"name\":\"window\","
      echo "\"border\":\"$LBLUE\","
      echo "\"border_left\":0,"
      echo "\"border_right\":0,"
      echo "\"border_top\":0,"
      echo "\"background\":\"$BLACK\","
      echo "\"full_text\":\" $(~/.bin/title | tail -n 1) \""
    echo "},"
    # Wireless Identity
      echo '{'
      echo "\"name\":\"mediastate\","
      echo "\"border\":\"$GREEN\","
      echo "\"border_left\":0,"
      echo "\"border_right\":0,"
      echo "\"border_top\":0,"
      echo "\"background\":\"$BLACK\","
      echo "\"full_text\":\"📶  $(~/.bin/wireless | tail -n 1) \""
    echo "},"
    # PC Temperature
      echo '{'
      echo "\"name\":\"temperature\","
      echo "\"border\":\"$MAGENTA\","
      echo "\"border_left\":0,"
      echo "\"border_right\":0,"
      echo "\"border_top\":0,"
      echo "\"background\":\"$BLACK\","
      echo "\"full_text\":\" $(~/.bin/temperature | tail -n 1) \""
    echo "},"
    # disk info
    echo '{'
      echo "\"name\":\"disk\","
      echo "\"border\":\"$RED\","
      echo "\"border_left\":0,"
      echo "\"border_right\":0,"
      echo "\"border_top\":0,"
      echo "\"background\":\"$BLACK\","
      echo "\"full_text\":\" $(/usr/share/i3blocks/disk | tail -n 1) \""
    echo "},"
    # volume
    echo '{'
      echo "\"name\":\"volume\","
      echo "\"border\":\"$BLUE\","
      echo "\"border_left\":0,"
      echo "\"border_right\":0,"
      echo "\"border_top\":0,"
      echo "\"background\":\"$BLACK\","
      echo "\"full_text\":\" $(~/.bin/soundstate) \""
    echo "},"
    # date
    echo '{'
      echo "\"name\":\"date\","
      echo "\"border\":\"$WHITE\","
      echo "\"border_left\":0,"
      echo "\"border_right\":0,"
      echo "\"border_top\":0,"
      echo "\"background\":\"$BLACK\","
      echo "\"full_text\":\" $(date '+%a %m.%d.%y') \""
    echo "},"
    # time
    echo '{'
      echo "\"name\":\"time\","
      echo "\"border\":\"$RED\","
      echo "\"border_left\":0,"
      echo "\"border_right\":0,"
      echo "\"border_top\":0,"
      echo "\"background\":\"$BLACK\","
      echo "\"full_text\":\" $(date '+%H.%M') \""
    echo "}"
    # battery (if present)
    battery=$(~/.bin/batstatus)
    if [[ ! -z ${battery} ]]; then
      echo ',{'
        echo "\"name\":\"battery\","
        echo "\"border\":\"$GREEN\","
        echo "\"border_left\":0,"
        echo "\"border_right\":0,"
        echo "\"border_top\":0,"
        echo "\"background\":\"$BLACK\","
        echo "\"full_text\":\"⚡ $(~/.bin/batstatus) \""
      echo "}"
    fi
  echo "]"
  read -t 1 tmp <&0
  tmp=$(echo ${tmp} | sed 's/^,//')
  if [[ ! -z $tmp ]] && [[ "$tmp" != "[" ]]; then
    process_json $tmp
  fi
done
