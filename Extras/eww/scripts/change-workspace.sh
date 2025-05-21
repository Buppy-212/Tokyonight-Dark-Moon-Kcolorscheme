#!/usr/bin/env dash
clamp() {
  current=$1
  val=$2
  python -c "print(max( ($current//6)*5+1, min($val, ($current//6)*5+5) ))"
}
direction=$1
current=$2
if test "$direction" = "down"; then
  target=$(clamp "$current" $((current + 1)))
  hyprctl dispatch workspace "$target"
elif test "$direction" = "up"; then
  target=$(clamp "$current" $((current - 1)))
  echo "jumping to $target"
  hyprctl dispatch workspace "$target"
fi
