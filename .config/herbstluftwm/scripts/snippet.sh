#!/bin/sh

case $1 in
    1)
        xdotool type $(grep -v '^#' ~/.local/share/snippets | dmenu -i -l 15 | cut -d' ' -f1)
        ;;
    2)
        new_snippet="$(xclip -o)"
        snippet_file="${HOME}/.local/share/snippets"

        if (grep -qF "$new_snippet") then 
            notify-send "¡Oops!" "El snippet ya existe"
        else
            echo "$new_snippet" >> "$snippet_file"
            notify-send "¡Snippet añadido!" "$new_snippet fue añadido al archivo"
        fi
        ;;
esac
