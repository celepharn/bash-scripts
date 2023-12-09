#!/bin/sh
mem_available=$(cat /proc/meminfo | awk '/MemAvailable/ {print $2}')
mem=$((((mem_available))/1000))
dunstify "🍭 Ram sanity check" "You got ${mem} MiB available"
