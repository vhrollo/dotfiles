#!/usr/bin/env bash

# get rid of the current wofi menu
pkill wofi

# Get list of active MPRIS players
players=$(playerctl -l 2>/dev/null)

[ -z "$players" ] && notify-send "No active media players found" && exit 0

menu_entries=()

# Build menu entries
while read -r player; do
    status=$(playerctl -p "$player" status 2>/dev/null)
    title=$(playerctl -p "$player" metadata title 2>/dev/null)
    artist=$(playerctl -p "$player" metadata artist 2>/dev/null)

    # Fallbacks
    [ -z "$title" ] && title="Unknown Title"
    [ -z "$artist" ] && artist="Unknown Artist"

    emoji="⏸"
    [ "$status" = "Playing" ] && emoji="▶️"

    entry="$emoji [$player] $artist – $title"
    menu_entries+=("$entry")
done <<< "$players"

# Present with wofi
selection=$(printf "%s\n" "${menu_entries[@]}" | wofi --dmenu --prompt="Select player to toggle" -n)

[ -z "$selection" ] && exit 0

# Extract player name from the selected entry
player=$(echo "$selection" | grep -oP '\[\K[^\]]+')

# Toggle play/pause
playerctl -p "$player" play-pause

# Notify updated status
new_status=$(playerctl -p "$player" status)
notify-send "$player: $new_status"

