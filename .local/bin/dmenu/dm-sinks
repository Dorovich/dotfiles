#!/bin/sh

sinks=$(pactl list sinks short | awk '{print $2}')
choice=$(echo "$sinks" | dmenu -p "Select sound output:" -l 5)
pactl set-default-sink $choice
