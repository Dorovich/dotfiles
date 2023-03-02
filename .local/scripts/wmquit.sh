#!/bin/sh

confirmation=$(echo "No\nLogout\nShutdown\nReboot" | dmenu -i -p "Do you want to quit?")

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
            "spectrwm")
                exit
                ;;
        esac
        ;;
    "Shutdown") shutdown -h now;;
    "Reboot") reboot;;
    *) exit;;
esac
