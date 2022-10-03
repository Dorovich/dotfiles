#!/bin/bash

scratchpad=/tmp/herbstluftwm:scratchpad

if [[ $(xdotool search --onlyvisible --class 'scratchpad') ]]; then
    if [ $(herbstclient list_monitors | grep '[FOCUS]' | cut -d'"' -f2) = $(herbstclient attr clients.$(cat $scratchpad) | grep 's - - tag' | awk '{ print $6 }' | cut -d'"' -f2) ]; then 
        xdotool search --onlyvisible --class 'scratchpad' windowunmap && exit 
    fi 
fi 

if [ -f "${scratchpad}" ]; then
    if [ -n $(herbstclient chain , bring $(cat "${scratchpad}") , jumpto $(cat "${scratchpad}")) ]; then
        xdotool search --class 'scratchpad' windowmap && exit
    fi
fi

if [ -n $(xdotool search --class 'scratchpad' windowmap) ]; then
    st -n 'scratchpad' -t 'scratchpad' -c 'scratchpad'
    xdotool search --sync --onlyvisible --class 'scratchpad'
    herbstclient attr clients.focus.winid > "${scratchpad}"
fi
