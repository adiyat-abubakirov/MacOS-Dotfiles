#!/usr/bin/env bash

# The $SELECTED variable is available for space components and indicates if
# the space invoking this script (with name: $NAME) is currently selected:
# https://felixkratz.github.io/SketchyBar/config/components#space----associate-mission-control-spaces-with-an-item
#

# if [[ -d $HOME/.cache/sketchybar/prev_space ]]; then
#   PREV=$(cat $HOME/.cache/sketchybar/prev_space)
#   if [[ $PREV ]]; then
#     if [[ "$(yabai -m query --spaces --space $PREV | jq '.windows | length')" -gt 0 ]]; then
#       sketchybar --set space."$PREV" icon.color=0xfffbf1c7
#     else
#       sketchybar --set space."$PREV" icon.color=0xff7c6f64
#     fi
#   fi
# fi
#
# for i in {1..10}; do
#   if [[ "$i" -ne $SID ]]; then
#     if [[ "$(yabai -m query --spaces --space $i | jq '.windows | length')" -gt 0 ]]; then
#       sketchybar --set space.$i icon.color=0xfffbf1c7
#     else
#       sketchybar --set space.$i icon.color=0xff7c6f64
#     fi
#   fi
# done

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
#
# if [[ -d $HOME/.cache/sketchybar ]]; then
#   mkdir -p $HOME/.cache/sketchybar
# fi
# echo $SID >$HOME/.cache/sketchybar/prev_space
