#!/bin/sh
# Author: github.com/celepharn
hour=$(timedatectl | grep Local | awk '{split($5, a, ":"); print a[1] ":" a[2]}')
dunstify "🕔 Time notificaton" " The time now is ${hour}"
