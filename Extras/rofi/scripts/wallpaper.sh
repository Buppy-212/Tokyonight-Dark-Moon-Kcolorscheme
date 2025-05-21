#!/usr/bin/env bash
DIR="$HOME"/Pictures/Wallpapers/
get() {
  readarray -t PICS < <(find "$DIR" -maxdepth 1 | grep -e ".png$" -e ".jpg$" -e ".jpeg$" -e ".webp$")
  for a in "${PICS[@]}"; do
    name=$(basename "$a")
    echo -en "$name\0icon\x1f$a\n"
  done
}
change() {
  NEW_PIC=$DIR$1
  # OLD_PIC="$(readlink "$XDG_STATE_HOME"/wallpaper)"
  # [ "$NEW_PIC" = "$OLD_PIC" ] && return
  # [ "$OLD_PIC" = "$DIR""Frieren.png" ] && eww-toggle date
  # [ "$1" = "Frieren.png" ] && eww-toggle date
  ln -sf "$NEW_PIC" "$XDG_STATE_HOME"/wallpaper
  # cp "$NEW_PIC" /usr/share/nwg-hello/wallpaper
  systemctl --user restart hyprpaper
  pkill rofi
}
case "$1" in
"")
  get
  ;;
*)
  change "$@"
  ;;
esac
