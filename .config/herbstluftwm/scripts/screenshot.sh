#!/usr/bin/env bash

case $1 in
    1)      # Full screen
        maim ~/Imágenes/Capturas/captura_$(date +%s).png
        ;;
    2)      # Active window
        maim -i $(xdotool getactivewindow) ~/Imágenes/Capturas/ventana_$(date +%s).png
        ;;
    3)      # Mouse selection
        maim -s ~/Imágenes/Capturas/recorte_$(date +%s).png
        ;;
    4)      # Mouse selection (copy)
        maim -s | xclip -selection clipboard -t image/png
        ;;
esac
