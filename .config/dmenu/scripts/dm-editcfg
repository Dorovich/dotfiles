#!/bin/sh

editorcmd="$TERMINAL -e $EDITOR"
choice=$(echo "Window Manager\nTerminal\nNeovim\nLibrewolf\nFirefox\nBash\nEmacs\nVimb\nCmus\nMpd\nDunst\nIrssi" | \
    dmenu -l 5 -i -p "Edit config file:" )

case $choice in
    "Window Manager")
        wm="$(wmname)"
        case $wm in
            "herbstluftwm")
                cfgpath="$HOME/.config/herbstluftwm/autostart"
                ;;
            "dwm")
                cfgpath="$HOME/.config/dwm/config.h"
                ;;
        esac
        ;;
    "Terminal")
        case $TERMINAL in
            "st")
                cfgpath="$HOME/.config/st-vido/config.h"
                ;;
            "kitty")
                cfgpath="$HOME/.config/kitty/kitty.conf"
                ;;
        esac
        ;;
    "Neovim")
        cfgpath="$HOME/.config/nvim/init.vim"
        ;;
    "Librewolf")
        cfgpath="$HOME/.librewolf/*.default/chrome/userChrome.css"
        ;;
    "Firefox")
        cfgpath="$HOME/.mozilla/firefox/*.default-release/chrome/userChrome.css"
        ;;
    "Bash")
        cfgpath="$HOME/.bashrc"
        ;;
    "Emacs")
        cfgpath="$HOME/.emacs.d/init.el"
        ;;
    "Vimb")
        cfgpath="$HOME/.config/vimb/config"
        ;;
    "Cmus")
        cfgpath="$HOME/.config/cmus/rc"
        ;;
    "Mpd")
        cfgpath="$HOME/.config/mpd/mpd.conf"
        ;;
    "Dunst")
        cfgpath="$HOME/.config/dunst/dunstrc"
        ;;
    "Irssi")
        cfgpath="$HOME/.irssi/config"
        ;;
    *)
        exit
        ;;
esac

$editorcmd $cfgpath
