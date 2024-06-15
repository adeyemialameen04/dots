#!/usr/bin/bash

curr=$(brightnessctl get)
max=$(brightnessctl max)

percentage=$((100 * curr / max))
echo "${percentage}%"
