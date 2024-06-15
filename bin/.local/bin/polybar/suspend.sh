#!/usr/bin/bash

if [ "$1" == "click" ]; then
	brightnessctl set 0%
	systemctl suspend
fi

echo "💤"
