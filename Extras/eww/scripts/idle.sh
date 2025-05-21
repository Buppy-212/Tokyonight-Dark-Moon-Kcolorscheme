#!/usr/bin/env dash

case "$1" in
--toggle)
  if pidof -q hypridle; then
    systemctl --user stop hypridle
    eww update idle="󰒳 "
  else
    systemctl --user start hypridle
    eww update idle="󰒲 "
  fi
  ;;
*)
  if pidof -q hypridle; then
    echo "󰒲 "
  else
    echo "󰒳 "
  fi
  ;;
esac
