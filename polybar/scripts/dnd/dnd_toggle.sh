#!/bin/bash

DND_FILE="/tmp/dnd_mode"

if [[ ! -f $DND_FILE ]]; then
    touch $DND_FILE  # Enable DND
    pkill -USR1 dunst
else
    notify-send "Do Not Disturb Disabled"
    rm $DND_FILE  # Disable DND
    pkill -USR2 dunst
fi
