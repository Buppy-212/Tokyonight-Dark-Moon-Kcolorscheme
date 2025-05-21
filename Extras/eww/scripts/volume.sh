#!/usr/bin/env dash
iDIR="$HOME/.config/mako/icons"

formatVol() {
  "$mute" && volume="0"
  [ "$volume" = "100" ] && return
  volume=$(printf "%02d" "$volume")
}

get_icon() {
  current=$(pamixer --get-volume)
  if [ "$current" -eq "0" ]; then
    echo "$iDIR/volume-mute.png"
  elif [ "$current" -ge "0" ] && [ "$current" -le "30" ]; then
    echo "$iDIR/volume-low.png"
  elif [ "$current" -ge "30" ] && [ "$current" -le "60" ]; then
    echo "$iDIR/volume-mid.png"
  elif [ "$current" -ge "60" ] && [ "$current" -le "100" ]; then
    echo "$iDIR/volume-high.png"
  fi
}

case "$1" in
"up")
  pamixer -i 5
  notify-send -h string:x-canonical-private-synchronous:sys-notify -u low -i "$(get_icon)" "Volume : $(pamixer --get-volume) %"
  ;;
"down")
  pamixer -d 5
  notify-send -h string:x-canonical-private-synchronous:sys-notify -u low -i "$(get_icon)" "Volume : $(pamixer --get-volume) %"
  ;;
"mute")
  if [ "$(pamixer --get-mute)" = "false" ]; then
    pamixer -m && notify-send -h string:x-canonical-private-synchronous:sys-notify -u low -i "$iDIR/volume-mute.png" "Volume Switched OFF"
  elif [ "$(pamixer --get-mute)" = "true" ]; then
    pamixer -u && notify-send -h string:x-canonical-private-synchronous:sys-notify -u low -i "$(get_icon)" "Volume Switched ON"
  fi
  ;;
"")
  sleep 1
  ;;
--toggle-mic)
  if [ "$(pamixer --default-source --get-mute)" = "false" ]; then
    pamixer --default-source -m && notify-send -h string:x-canonical-private-synchronous:sys-notify -u low -i "$iDIR/microphone-mute.png" "Microphone Switched OFF"
  elif [ "$(pamixer --default-source --get-mute)" = "true" ]; then
    pamixer -u --default-source u && notify-send -h string:x-canonical-private-synchronous:sys-notify -u low -i "$iDIR/microphone.png" "Microphone Switched ON"
  fi
  ;;
*)
  pamixer --set-volume "$1"
  ;;
esac

mute=$(pamixer --get-mute)
volume=$(pamixer --get-volume)
formatVol
echo "$volume"
eww update volume="$volume"
