#!/usr/bin/env dash
iDIR="$HOME/.config/mako/icons/"
notify() {
  brightness=$((100 * $(brightnessctl g) / $(brightnessctl m)))
  if [ "$brightness" -le 20 ]; then
    img="$iDIR/brightness-20.png"
  elif [ "$brightness" -gt 20 ] && [ "$brightness" -le 40 ]; then
    img="$iDIR/brightness-40.png"
  elif [ "$brightness" -gt 40 ] && [ "$brightness" -le 60 ]; then
    img="$iDIR/brightness-60.png"
  elif [ "$brightness" -gt 60 ] && [ "$brightness" -le 80 ]; then
    img="$iDIR/brightness-80.png"
  else
    img="$iDIR/brightness-100.png"
  fi
  notify-send -h string:x-canonical-private-synchronous:sys-notify -u low -i "$img" "Brightness : $brightness"
}

icon=" "
pidof -q hyprsunset && icon=" "
case "$1" in
--toggle)
  if [ "$icon" = " " ]; then
    pkill hyprsunset
    icon=" "
  else
    uwsm app -- hyprsunset -t 2500 &
    icon=" "
  fi
  ;;
"up")
  brightnessctl s +5%
  notify
  ;;
"down")
  brightnessctl s 5-%
  notify
  ;;
"")
  brightness=$((100 * $(brightnessctl g) / $(brightnessctl m)))
  brightness=$(printf "%02d" $brightness)
  printf "{\"icon\":\"%s\",\"value\":\"%s\"}" "$icon" "$brightness"
  exit
  ;;
*)
  brightnessctl s "$1"%
  ;;
esac

brightness=$((100 * $(brightnessctl g) / $(brightnessctl m)))
brightness=$(printf "%02d" $brightness)
eww update brightness="$(printf "{\"icon\":\"%s\",\"value\":\"%s\"}" "$icon" "$brightness")"
