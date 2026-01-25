#!/usr/bin/env bash

if [[ $SID -eq 1 ]]; then
  if [[ "$(yabai -m query --spaces --space $SID | jq '.windows | length')" -gt 1 || "$SELECTED" == "true" ]]; then
    sketchybar --set $NAME icon.color=0xfffbf1c7
  else
    sketchybar --set $NAME icon.color=0xff7c6f64
  fi
else
  if [[ "$(yabai -m query --spaces --space $SID | jq '.windows | length')" -gt 0 || "$SELECTED" == "true" ]]; then
    sketchybar --set $NAME icon.color=0xfffbf1c7
  else
    sketchybar --set $NAME icon.color=0xff7c6f64
  fi
fi

sketchybar --set "$NAME" background.drawing="$SELECTED"
