#!/bin/sh
# Author: github.com/celepharn
# Script to notify battery info

# Do the following continously
while true
do
	charge=0
	# Grab battery levels and charging status  
	battery_levels=$(acpi -b | grep -P -o '[0-9]+(?=%)')
	battery_status=$(acpi -b | grep -P -o '(.charging)')
	
	# I have two batteries so I need to sum them
	for item in $battery_levels
	do
		#echo "$item"
		charge=$(($charge+$item))
	done

	# Now get the average
	battery_level=$(((($charge))/2))
	status=$(acpi -b | grep -P -o 'Discharging')
	if [ -z "${status}" ]; then
		status="discharging"
	else 
		status="charging"
	fi
	if [ $battery_level -gt 92 ]; then
		dunstify "🔥 Battery full." "You can unplug now."
		sleep 500
	elif [ $battery_level -eq 80 ]; then
		dunstify "😌 Battery ok." "Battery level: ${battery_level}%, ${status}"
		sleep 500
	elif [ $battery_level -eq 60 ]; then
		dunstify "😌 Battery ok." "Battery level: ${battery_level}%, ${status}"
		sleep 500
	elif [ $battery_level -eq 40 ]; then
		dunstify "😌 Battery ok." "Battery level: ${battery_level}%, ${status}"
		sleep 500
	elif [ $battery_level -eq 20 ]; then
		dunstify "🙀 Think, think!" "Battery level: ${battery_level}%, ${status}"
		sleep 500
	elif [ $battery_level -eq 15 ]; then
		dunstify "😨 Gotta do something!" "Battery level: ${battery_level}%, ${status}"
		sleep 500
	elif [ $battery_level -eq 10 ]; then
		dunstify "😵 Last rope!" "Battery level: ${battery_level}%, ${status}"
		sleep 500
	elif [ $battery_level -le 5 ] && [[ $status == 'discharging' ]]; then
		dunstify --urgency=CRITICAL "😵 Find an outlet NOW." "Battery level: ${battery_level}%, ${status}"
		#echo "hi"
		sleep 120
	fi
	sleep 20
done
