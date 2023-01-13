#!/usr/bin/env bash

herbstclient --idle "tag_*" 2>/dev/null | {

    while true; do
        # Read tags into $tags as array
        IFS=$'\t' read -ra tags <<< "$(herbstclient tag_status)"
        {
            for i in "${tags[@]}" ; do
                # Read the prefix from each tag and render them accordingly
                case ${i:0:1} in
                    '#')
                        # the tag is viewed on the focused monitor
                        echo "%{F#151515}%{B#D19A66}%{T2}"
                        ;;
                    ':')
                        # : the tag is not empty
                        echo "%{F#ABB2BF}%{B-}%{T2}"
                        ;;
                    '!')
                        # ! the tag contains an urgent window
                        echo "%{F#151515}%{B#C678DD}%{T2}"
                        ;;
                    '-')
                        # - the tag is viewed on a monitor that is not focused
                        echo "%{F#151515}%{B#98C379}%{T2}"
                        ;;
                    *)
                        # . the tag is empty
                        echo "%{F#5C6370}%{B-}%{T2}"
                        ;;
                esac
                     # accion 1,                     texto, fin de accion 1,
                echo "%{A1:herbstclient use ${i:1}:} ${i:1} %{A}"
            done

            echo "%{F-}%{B-}"
        } | tr -d "\n"

    echo

    # wait for next event from herbstclient --idle
    read -r || break
done
} 2>/dev/null
