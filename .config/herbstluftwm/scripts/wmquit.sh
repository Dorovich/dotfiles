#!/bin/sh

confirmation=$(echo "No\nLogout\nShutdown" | dmenu -i -p "Do you want to quit?")

case $confirmation in
    "Logout")
        wm="$(wmname)"
        case $wm in
            "herbstluftwm")
                herbstclient quit
                ;;
            "dwm")
                kill -TERM $(pidof dwm)
                ;;
        esac
        ;;
    "Shutdown")
        shutdown -h now
        ;;
    *)
        exit
        ;;
esac
