#!/bin/sh

bssid=$(nmcli device wifi list | sed -n '1!p' | cut -b 9- | dmenu -p "Select Wifi:" | cut -d' ' -f1)

[ -n "$bssid" ] || exit 0

pass=$(echo "" | dmenu -p "Enter Password:")

[ -n "$pass" ] && nmcli device wifi connect "$bssid" password "$pass" || nmcli device wifi connect "$bssid"
sleep 10

if ping -q -c 2 -W 2 google.com >/dev/null; then
    notify-send "Your internet is working :)"
else
    notify-send "Your internet is not working :("
fi
