#!/bin/sh
# Author: github.com/celepharn
while true
do
	# Grab available ram
	mem_available=$(cat /proc/meminfo | awk '/MemAvailable/ {print $2}')

	# Set a threshold, modify this to your needs
	if [ $mem_available -le 500000 ]; then
		# Convert to MiB
		mem=$((((mem_available))/1000))
		# Notify
		dunstify "🚨 Warning: low RAM" "You got ${mem} MiB left"
	fi
	sleep 30
done
