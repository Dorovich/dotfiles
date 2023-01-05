#!/bin/sh

confirmation=$(echo "No\nLogout\nShutdown" | dmenu -i -p "Do you want to quit?")

case $confirmation in
    "Logout")
        herbstclient quit
        ;;
    "Shutdown")
        shutdown -h now
        ;;
    *)
        exit
        ;;
esac
