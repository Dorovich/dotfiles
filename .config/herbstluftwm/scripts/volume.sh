#!/usr/bin/env bash

case $1 in
    1)      # mpc volume up
        mpc volume +5
        pkill herbe
        herbe "mpc $(mpc volume)"
        ;;
    2)      # mpc volume down
        mpc volume -5
        pkill herbe
        herbe "mpc $(mpc volume)"
        ;;
esac
