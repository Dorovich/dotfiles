#!/usr/bin/env bash

herbstclient --idle "tag_*" 2>/dev/null | {

    while true; do
        # Read tags into $tags as array
        IFS=$'\t' read -ra tags <<< "$(herbstclient tag_status)"
        {
            for i in "${tags[@]}" ; do
                # Read the prefix from each tag and render them according to that prefix
                case ${i:0:1} in
                    '#')
                        # the tag is viewed on the focused monitor
                        # TODO Add your formatting tags for focused workspaces
                        echo "%{F#151515}%{B#D19A66}%{T2}" # Add your formatting tags for empty workspaces
                        ;;
                    ':')
                        # : the tag is not empty
                        # TODO Add your formatting tags for occupied workspaces
                        echo "%{F#ABB2BF}%{B-}%{T2}" # Add your formatting tags for empty workspaces
                        ;;
                    '!')
                        # ! the tag contains an urgent window
                        # TODO Add your formatting tags for workspaces with the urgent hint
                        echo "%{F#151515}%{B#C678DD}%{T2}" # Add your formatting tags for empty workspaces
                        ;;
                    '-')
                        # - the tag is viewed on a monitor that is not focused
                        # TODO Add your formatting tags for visible but not focused workspaces
                        echo "%{F#151515}%{B#98C379}%{T2}" # Add your formatting tags for empty workspaces
                        ;;
                    *)
                        # . the tag is empty
                        # There are also other possible prefixes but they won't appear here
                        echo "%{F#5C6370}%{B-}%{T2}" # Add your formatting tags for empty workspaces
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
