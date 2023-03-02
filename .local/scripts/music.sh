#!/bin/sh

while true; do
    mpc status | grep "playing" 2> /dev/null
    if [ $? -eq 0 ]; then
        choice=$(echo "pause\njump\nartist\nalbum\ntrack\nload\nclear\nupdate\ntoggle" | dmenu -p "[>] $(mpc current -f "%title%")")
    else
        choice=$(echo "play\njump\nartist\nalbum\ntrack\nload\nclear\nupdate\ntoggle" | dmenu -p "[-] $(mpc current -f "%title%")")
    fi

    case $choice in
        play)
            mpc play
            ;;
        pause)
            mpc pause
            ;;
        jump)
            $SCRIPTSDIR/mpdctl.sh -j
            ;;
        artist)
            $SCRIPTSDIR/mpdctl.sh -a
            ;;
        album)
            $SCRIPTSDIR/mpdctl.sh -l
            ;;
        track)
            $SCRIPTSDIR/mpdctl.sh -t
            ;;
        load)
            $SCRIPTSDIR/mpdctl.sh -p
            ;;
        clear)
            mpc clear
            ;;
        update)
            mpc update
            ;;
        toggle)
            mpc status | grep "random: on" 2> /dev/null
            if [ $? -eq 0 ]; then random="?"; else random="-"; fi
            mpc status | grep "consume: on" 2> /dev/null
            if [ $? -eq 0 ]; then consume="X"; else consume="-"; fi
            mpc status | grep "repeat: on" 2> /dev/null
            if [ $? -eq 0 ]; then repeat="@"; else repeat="-"; fi

            option=$(echo "random\nconsume\nrepeat" | dmenu -p "[$random$consume$repeat]")

            case $option in
                random)
                    mpc random
                    ;;
                consume)
                    mpc consume
                    ;;
                repeat)
                    mpc repeat
                    ;;
            esac
            ;;
        *)
            echo 'Program terminated'
            break
        ;;
    esac
done
