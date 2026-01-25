#!/usr/bin/env bash
#ram.sh

sketchybar -m --set $NAME label="$(bc <<< "($(top -l 2 | grep -E '^CPU' | tail -1 | awk '{print $3 + $5"%"}' | sed 's/%$//') + 0.5) / 1")"
