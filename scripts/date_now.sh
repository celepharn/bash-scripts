#!/bin/sh
# Author: github.com/celepharn
dateFormatted=$(date | awk '{split($1, a, "T"); print a[1]}' | awk '{split($1, a, "-"); print a[3] "/" a[2] "/" a[1]}')
dunstify "📚 Date notification" " The date is ${dateFormatted}"
