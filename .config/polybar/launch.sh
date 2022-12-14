#!/bin/bash

# Terminate already running bar instances
if pgrep -x polybar >/dev/null
then
    killall -q polybar
fi
# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

polybar bar1-hlwm --reload --config=/home/vido25/.config/polybar/config.ini &
