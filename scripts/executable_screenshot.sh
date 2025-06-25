#!/bin/bash

# Save directory
DIR="$HOME/Pictures/Screenshots"
mkdir -p "$DIR"

# Filename with timestamp
FILE="$DIR/Screenshot-$(date +%Y%m%d-%H%M%S).png"

# Screenshot mode
MODE="$1"

# Take screenshot
if [ "$MODE" == "region" ]; then
    grim -g "$(slurp)" - | tee "$FILE" | wl-copy && \
    notify-send "󰄄 Region Screenshot" "$FILE and copied to clipboard."
elif [ "$MODE" == "full" ]; then
    grim - | tee "$FILE" | wl-copy && \
    notify-send "󰄄 Fullscreen Screenshot" "$FILE and copied to clipboard."
else
    echo "Usage: $0 [region|full]"
    exit 1
fi

