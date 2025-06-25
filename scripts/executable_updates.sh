#!/usr/bin/env bash

# Only run on Arch
[[ -f /etc/arch-release ]] || exit 0

# === Confirmation dialog using yad ===
confirm_update() {
  yad --title="Confirm Update" \
      --center --fixed --undecorated \
      --button=Yes:0 --button=No:1 \
      --text="Proceed with system update?" \
      --text-align=center --align=center --justify=center \
      --buttons-layout=center \
      --width=300
}

# Count pending updates
AUR_COUNT=$(yay -Qua 2>/dev/null | wc -l)
OFFICIAL_COUNT=$(checkupdates 2>/dev/null | wc -l)
TOTAL=$((AUR_COUNT + OFFICIAL_COUNT))

case "$1" in
  aur)
    printf " %d\n" "$AUR_COUNT"
    exit 0
    ;;
  official)
    printf " %d\n" "$OFFICIAL_COUNT"
    exit 0
    ;;
  update)
    # Ask for confirmation before doing the full upgrade
    if confirm_update; then
      alacritty -e sh -c 'yay -Syu; echo; read -p "Press ENTER to close"' &
    fi
    exit 0
    ;;
  *)
    # Default (including no args): always show total
    printf " %d\n" "$TOTAL"
    exit 0
    ;;
esac

