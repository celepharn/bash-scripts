#!/bin/sh
while true
do
	mem_available=$(cat /proc/meminfo | awk '/MemAvailable/ {print $2}')
	if [ $mem_available -le 500000 ]; then
		mem=$((((mem_available))/1000))
		dunstify "🚨 Warning: low RAM" "You got ${mem} MiB left"
	fi
	sleep 30
done
