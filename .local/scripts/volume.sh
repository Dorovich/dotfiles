#!/usr/bin/env bash

case $1 in
    1) mpc volume +5;;
    2) mpc volume -5;;
    *) exit;;
esac

notify-send "mpd $(mpc volume)"
