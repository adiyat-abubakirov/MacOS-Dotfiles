#!/usr/bin/env bash
#ram.sh

sketchybar -m --set $NAME label="$(bc <<< "($(smctemp -c) + 0.5) / 1")"
# sketchybar -m --set $NAME label="$(printf '%.0f' $(smctemp -c))°C"
