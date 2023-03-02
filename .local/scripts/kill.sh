#!/bin/env bash

selected=$(ps --user "$USER" -F | \
                dmenu -l 5 -p "Search for process to kill:" | \
                awk '{print $2" "$11}')

if [ "$selected" ]; then
    answer=$(echo -e "No\nYes" | dmenu -p "Kill $selected?")

    if [ "$answer" == "Yes" ]; then
        kill -9 "${selected%% *}"
        echo "Process $selected has been killed."
    else
        echo "Program terminated."
    fi
fi
