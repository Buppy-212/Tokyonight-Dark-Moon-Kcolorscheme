#!/usr/bin/env dash

check() {
  {
    paru -Qua
    checkupdates
  } | wc -l >"$HOME"/.local/state/updates
  eww update updates="$(display)"
}

display() {
  COUNT=$(cat "$HOME"/.local/state/updates)
  if [ "$COUNT" = "0" ]; then
    printf "{\"tooltip\":\"Updated\",\"show\":false}"
  else
    printf "{\"tooltip\":\"%s\",\"show\":true}" "$COUNT"
  fi
}

case "$1" in
--update)
  kitty --title=floatty -e dash -c "paru -Syu"
  check
  ;;
--check)
  check
  ;;
*)
  display
  ;;
esac
