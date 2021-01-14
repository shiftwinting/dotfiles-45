#!/bin/sh

class=$(playerctl metadata -p MellowPlayer3 --format '{{lc(status)}}')
icon=" "

if [[ $class == "playing" ]]; then
  info=$(playerctl metadata -p MellowPlayer3 --format '{{title}} - {{artist}}')
  if [[ ${#info} > 25 ]]; then
    info=$(echo $info | cut -c1-25)"..."
  fi
  text=$info" "$icon
elif [[ $class == "paused" ]]; then
  text=$icon
elif [[ $class == "stopped" ]]; then
  text=""
fi

echo -e "{\"text\":\""$text"\", \"class\":\""$class"\"}"
