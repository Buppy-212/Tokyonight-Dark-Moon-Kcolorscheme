#!/usr/bin/env dash

HYPRGAMEMODE=$(hyprctl getoption animations:enabled | awk 'NR==1{print $2}')

case "$1" in
--toggle)
  if [ "$HYPRGAMEMODE" = 1 ]; then
    hyprctl -q --batch "\
      keyword animations:enabled 0;\
      keyword decoration:drop_shadow 0;\
      keyword decoration:blur:enabled 0;\
      keyword decoration:rounding 0;\
      keyword general:gaps_in 0;\
      keyword general:border_size 0;\
      keyword general:gaps_out 0"
    eww update gamemode="G"
  else
    hyprctl -q reload
    eww update gamemode="N"
  fi
  ;;
*)
  if [ "$HYPRGAMEMODE" = 1 ]; then
    echo "N"
  else
    echo "G"
  fi
  ;;
esac
