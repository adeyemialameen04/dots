#!/usr/bin/bash

# Debugging: Log to a file
echo "Script called with argument: $1" >>/tmp/color.sh.log

if [ "$1" == "click" ]; then
	# More debugging
	echo "xcolor command executed" >>/tmp/color.sh.log
	# xcolor | tr -d '\n' | xclip -selection clipboard
	xcolor
fi

# Indicate the script ran
echo "🌈"
