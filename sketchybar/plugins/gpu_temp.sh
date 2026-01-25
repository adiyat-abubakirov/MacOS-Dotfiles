#!/usr/bin/env bash
#ram.sh

sketchybar -m --set $NAME label="$(bc <<< "($(smctemp -g) + 0.5) / 1")"
