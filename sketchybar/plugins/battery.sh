#!/bin/sh

PERCENTAGE="$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)"
CHARGING="$(pmset -g batt | grep 'AC Power')"

if [ "$PERCENTAGE" = "" ]; then
  exit 0
fi

case "${PERCENTAGE}" in
9[0-9] | 100)
  ICON=""
  sketchybar --set $NAME icon.color=0xff689d6a
  sketchybar --set $NAME label.color=0xfffbf1c7
  ;;
[6-8][0-9])
  ICON=""
  sketchybar --set $NAME icon.color=0xff689d6a
  sketchybar --set $NAME label.color=0xfffbf1c7
  ;;
[3-5][0-9])
  ICON=""
  sketchybar --set $NAME icon.color=0xffd79921
  sketchybar --set $NAME label.color=0xfffabd2f
  ;;
[1-2][0-9])
  ICON=""
  sketchybar --set $NAME icon.color=0xffd65d0e
  sketchybar --set $NAME label.color=0xfffe8019
  ;;
*)
  ICON=""
  sketchybar --set $NAME icon.color=0xffcc241d
  sketchybar --set $NAME label.color=0xfffb4934
  ;;
esac

if [[ "$CHARGING" != "" ]]; then
  ICON=""
  sketchybar --set $NAME icon.color=0xff689d6a
fi

# The item invoking this script (name $NAME) will get its icon and label
# updated with the current battery status
sketchybar --set "$NAME" icon="$ICON" label="${PERCENTAGE}"
