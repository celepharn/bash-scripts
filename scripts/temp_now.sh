#!/bin/sh
# Author: github.com/celepharn
temp=$(sensors | awk '/Package id 0/ {print $4}')
dunstify "🍃 CPU Temp info" " Temp: ${temp}"
