#!/usr/bin/bash
TEMP=/tmp/current_wall

files=(~/.config/hypr/wallpapers/*)

scripts=~/scripts

cooldown=0

change () {
    index=$(cat $TEMP)
    index=$((index+$1))
    if [ $index -ge ${#files[@]} ]; then
        index=0
    fi
    echo $index > $TEMP
    $scripts/wall.sh "${files[$index]}"
    exit 0
}

while true
do
    case "$1" in
        "cycle")
            change 1
            ;;
        "cycler")
            change -1
            ;;
        "arrow-icon")
            if $scripts/tools/toolbar_state; then
                echo '{"text":"","tooltip":"Collapse"}'
            else
                echo '{"text":"","tooltip":"Expand"}'
            fi
            ;;
        "ss-icon")
            if $scripts/tools/toolbar_state; then
                echo '{"text":"","tooltip":"Screenshot"}'
            else
                echo ""
            fi
            ;;
        "weather")
            if $scripts/tools/toolbar_state; then
                ~/.scripts/wttr
            else
                echo ""
            fi
            ;;
        "wall")
            if $scripts/tools/toolbar_state; then
                echo '{"text":" ","tooltip":"Wallpaper Next | Prev"}'
            else
                echo ""
            fi
            ;;
        "power")
            if $scripts/tools/toolbar_state; then
                echo '{"text":"⏻","tooltip":"Power"}'
            else
                echo ""
            fi
            ;;
        "clipboard")
            if $scripts/tools/toolbar_state; then
                echo '{"text":"","tooltip":"Clipboard | Nuke | Delete"}'
            else
                echo ""
            fi
            ;;
    esac
    sleep $cooldown
done
