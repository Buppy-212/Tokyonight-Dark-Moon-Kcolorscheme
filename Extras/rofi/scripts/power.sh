#!/usr/bin/env bash
ICONDIR="$HOME"/.config/rofi/icons/
ICONS=(Shutdown Reboot Logout Lock Suspend Hibernate Gamemode Idle Filter)

declare -A actions
actions[Shutdown]="systemctl poweroff"
actions[Reboot]="systemctl reboot"
actions[Logout]="uwsm stop"
actions[Lock]="loginctl lock-session"
actions[Suspend]="systemctl suspend"
actions[Hibernate]="systemctl hibernate"
actions[Gamemode]="$XDG_CONFIG_HOME/eww/scripts/gamemode.sh --toggle"
actions[Idle]="$XDG_CONFIG_HOME/eww/scripts/idle.sh --toggle"
actions[Filter]="$XDG_CONFIG_HOME/eww/scripts/brightness.sh --toggle"

case "$1" in
"")
  for a in "${ICONS[@]}"; do
    path="$ICONDIR$a.png"
    echo -en "$a\0icon\x1f$path\n"
  done
  ;;
*)
  ${actions["$1"]}
  pkill rofi
  ;;
esac
