#!/usr/bin/env dash

WIRED=$(nmcli | grep "^enp")
WIRELESS=$(nmcli | grep "^wlp")

if [ "$(echo "$WIRED" | cut -d" " -f2)" = connected ]; then
  icon=""
  name=$(echo "$WIRED" | sed 's/\ connected\ to\ /Connected to /g' | cut -d ':' -f2)
elif [ "$(echo "$WIRELESS" | cut -d" " -f2)" = connected ]; then
  icon="󰖩"
  name=$(echo "$WIRELESS" | sed 's/\ connected\ to\ /Connected to /g' | cut -d ':' -f2)
else
  icon="󰖪"
  name="Disconnected"
fi

printf "{\"name\":\"%s\",\"icon\":\"%s\"}" "$name" "$icon"
