#!/usr/bin/env bash
#ram.sh

sketchybar -m --set $NAME label="$((10#$(memory_pressure | grep "System-wide memory free percentage:" | awk '{ printf("%02.0f\n", 100-$5"%") }')))"
