#!/bin/sh
# Author: github.com/celepharn
# Script to notify battery info
charge=0
battery_levels=$(acpi -b | grep -P -o '[0-9]+(?=%)')
#battery_status=$(acpi -b | grep -P -o '(.charging)')
# I have two batteries so I need to add both percentages 
for item in $battery_levels
do
	charge=$(($charge+$item))
done

# And now get the average
battery_level=$(((($charge))/2))

# See if either battery is charging
status=$(acpi -b | grep -P -o 'Charging')
if [ -z "${status}" ]; then
	status="discharging"
else 
	status="charging"
fi

# Notify the results
dunstify "🍫 Battery sanity check" "Level: ${battery_level}% and ${status}"
