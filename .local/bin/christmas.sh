#!/bin/bash
trap "tput reset; tput cnorm; exit" 2
clear
tput civis
num_lines=$(($(tput lines) / 2 - 9))
lin=$num_lines
col=$(($(tput cols) / 2))
c=$((col-1))
est=$((c-2))
color=0
tput setaf 2; tput bold

tput cup $((lin - 1)) $col
echo 六

# Tree
for ((i=1; i<20; i+=2))
{
    tput cup $lin $col
    for ((j=1; j<=i; j++))
    {
        echo -n \*
    }
    let lin++
    let col--
}

tput sgr0; tput setaf 3

# Trunk
for ((i=1; i<=3; i++))
{
    tput cup $((lin++)) $c
    echo 'mWm'
}
tput cup $((lin++)) $c
echo ""
new_year=$(date +'%Y')
let new_year++
tput setaf 1; tput bold
tput cup $lin $((c - 15)); echo "Merry Christmas you Filthy Animal!"
tput cup $((lin + 1)) $c
echo ""
tput cup $((lin+ 2)) $((c - 10)); echo And lots of CODE in $new_year
let c++
k=1

# Lights and decorations
while true; do
    for ((i=1; i<=35; i++)) {
        # Turn off the lights
        [ $k -gt 1 ] && {
            tput setaf 2; tput bold
            tput cup ${line[$[k-1]$i]} ${column[$[k-1]$i]}; echo \*
            unset line[$[k-1]$i]; unset column[$[k-1]$i]  # Array cleanup
        }

        li=$((RANDOM % 9 + num_lines + 1))
        start=$((c-li+num_lines))
        co=$((RANDOM % (li-num_lines) * 2 + 1 + start))
        tput setaf $color; tput bold   # Switch colors
        tput cup $li $co
        echo o
        line[$k$i]=$li
        column[$k$i]=$co
        color=$(((color+1)%8))
        # Flashing text
        sh=1
        for l in C O D E
        do
            tput cup $((lin+2)) $((c+sh))
            echo $l
            let sh++
            sleep 0.01
        done
    }
    k=$((k % 2 + 1))
done

