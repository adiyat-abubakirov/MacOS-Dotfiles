#!/usr/bin/env bash

status=$(blueutil | grep "^Power:" | grep -o '[0-1]\+$')
if [[ $status -eq 1 ]]; then
  sketchybar -m --set $NAME drawing=on
  status=$(pmset -g accps | tail -n 1)
  if [[ ! $(echo "$status" | grep "InternalBattery") ]]; then
    sketchybar --set $NAME label.drawing=on label="$(echo $status | grep -o '[0-9]*%' | tr -d '%')"
  else
    sketchybar --set $NAME label.drawing=off
  fi
else
  sketchybar --set $NAME drawing=off
fi
