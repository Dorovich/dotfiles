# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
# if [ -n "$BASH_VERSION" ]; then
#     # include .bashrc if it exists
#     if [ -f "$HOME/.bashrc" ]; then
# 	. "$HOME/.bashrc"
#     fi
# fi

# setup path
[ -d "$HOME/.bin" ] && PATH="$HOME/.bin:$PATH"
[ -d "$HOME/.local/bin" ] && PATH="$HOME/.local/bin:$PATH"
[ -d "$HOME/.local/bin/statusbar" ] && PATH="$HOME/.local/bin/statusbar:$PATH"
[ -d "$HOME/.local/bin/dmenu" ] && PATH="$HOME/.local/bin/dmenu:$PATH"
[ -d "$HOME/.emacs.d/bin" ] && PATH="$HOME/.emacs.d/bin:$PATH"
[ -d "$HOME/Applications" ] && PATH="$HOME/Applications:$PATH"
[ -d "/var/lib/flatpak/exports/bin/" ] && PATH="/var/lib/flatpak/exports/bin/:$PATH"
[ -d "$HOME/.vim/bin" ] && PATH="$HOME/.vim/bin:$PATH"
[ -d "/opt/bochs_gdb/bin" ] && PATH="/opt/bochs_gdb/bin:$PATH"

# other variables
export TERMINAL="urxvtc"
export EDITOR="nvim"
export BROWSER="firefox"
export SCRIPTSDIR="/home/vido25/.local/bin/dmenu"
export DMENU_FLAGS="-h 20 -i"
export XMODIFIERS=
export SBCL_HOME=/usr/lib/sbcl/

export GUIX_LOCPATH="$HOME/.guix-profile/lib/locale"
export GUIX_PROFILE="$HOME/.guix-profile"
source "$GUIX_PROFILE/etc/profile"

export EMACSLOADPATH=
export QT_STYLE_OVERRIDE=kvantum
export WEBKIT_DISABLE_COMPOSITING_MODE=1
