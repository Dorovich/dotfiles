#!/usr/bin/env bash

case $1 in
    1|"up") mpc volume +5;;
    2|"down") mpc volume -5;;
    *) exit;;
esac

notify-send "mpd $(mpc volume)"
