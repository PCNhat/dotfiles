#!/bin/bash

 # Get the current workspace and fullscreen state
fullscreen_state=$(i3-msg -t get_tree | jq '.. | select(.focused? == true) | .fullscreen_mode')
monitor=$(i3-msg -t get_workspaces | jq -r '.[] | select(.focused == true) | .output')

# Get the Polybar PID for the active monitor
polybar_pid=$(pgrep -a polybar | grep "$monitor" | awk '{print $1}')

if [[ $fullscreen_state == 1 ]]; then
    # Hide Polybar when fullscreen
    polybar-msg -p "$polybar_pid" cmd hide
else
    # Show Polybar when exiting fullscreen
    polybar-msg -p "$polybar_pid" cmd show
fi
