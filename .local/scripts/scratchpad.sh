#!/bin/bash

scratchpad=/tmp/herbstluftwm:scratchpad


# comprobar si la scratchpad no existe, si no existe se crea
if [ -n $(xdotool search --class 'scratchpad') ]; then
    st -n 'scratchpad' -t 'scratchpad' -c 'scratchpad'
    xdotool search --sync --onlyvisible --class 'scratchpad'
    herbstclient attr clients.focus.winid > "${scratchpad}"
fi 

# la scratchpad ha sido creada en este punto de la ejecucion
if [ -f "${scratchpad}" ]; then

    if [ -n $(xdotool search --onlyvisible --class 'scratchpad') ]; then

        cond1=$(herbstclient list_monitors | grep '[FOCUS]' | cut -d'"' -f2)
        cond2=$(herbstclient attr clients.$(cat $scratchpad) | grep 's - - tag' | awk '{ print $6 }' | cut -d'"' -f2)

        if [ $cond1 = $cond2 ]; then 
            xdotool search --onlyvisible --class 'scratchpad' windowunmap && exit 
        fi 

    else  

        : '
        scratchpad_data="$(cat "${scratchpad}")"
        if [ -n $(herbstclient chain , bring $scratchpad_data , jumpto $scratchpad_data) ]; then
            xdotool search --class 'scratchpad' windowmap && exit
        fi
        '
        herbstclient chain , bring $(cat "${scratchpad}"), jumpto $(cat "${scratchpad}")
        xdotool search --class 'scratchpad' windowmap && exit

    fi

fi
