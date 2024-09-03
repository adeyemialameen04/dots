#!/bin/bash

CLIPBOARD_DIR="$HOME/.clipboard_images"
mkdir -p "$CLIPBOARD_DIR"

IMAGE_PATH="$CLIPBOARD_DIR/$(date +%Y%m%d%H%M%S).png"
xclip -selection clipboard -t image/png -o >"$IMAGE_PATH"

IMAGE_LIST=$(ls -t "$CLIPBOARD_DIR"/*.png | head -n 10)

SELECTED_IMAGE=$(echo "$IMAGE_LIST" | rofi -dmenu -i -p "Select clipboard image:")

if [ -n "$SELECTED_IMAGE" ]; then
  feh "$SELECTED_IMAGE"
fi
