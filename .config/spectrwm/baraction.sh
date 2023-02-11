#!/bin/sh

my_clock() {
    clock_status="$(date '%a %d de %b, %H:%M')"
    echo "$clock_status"
}

while true; do
    echo "$(my_clock)"
    sleep 1m
done
