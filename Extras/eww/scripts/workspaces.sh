#!/usr/bin/env dash

spaces() {
  WORKSPACE_WINDOWS=$(hyprctl workspaces -j | jq 'map({key: .id | tostring, value: .windows}) | from_entries')
  seq 1 10 | jq --argjson windows "${WORKSPACE_WINDOWS}" --slurp -Mc 'map(tostring) | map({id: ., windows: ($windows[.]//0)})'
  [ "$(echo "$WORKSPACE_WINDOWS" | wc -l)" = 13 ] && eww update minimised=true
  [ "$(echo "$WORKSPACE_WINDOWS" | wc -l)" = 12 ] && eww update minimised=false
}

spaces
socat -u UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock - | while read -r line; do
  spaces
done
