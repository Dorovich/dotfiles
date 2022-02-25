# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# dotfiles:
#   $ mkdir ~/dotfiles
#   $ git init --bare $HOME/dotfiles
#   $ alias config="/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME"
#   $ config config --local status.showUntrackedFiles no
# uso:
#   $ config add <file>          <- añade un archivo para seguirlo
#   $ config commit -m "mesaje"  <- envia los cambios
#   $ config push                <- sube los cambios
alias config="/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME"

# variables globales
export ALM="/media/vido25/Almacenamiento"

# binarios en ~/.local
export PATH="${PATH}:${HOME}/.local/bin"

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

###########################################
###               ALIASES               ###
###########################################

alias v="nvim"
alias aptup="sudo apt update && sudo apt upgrade"
alias aptupd="sudo apt update"
alias aptupg="sudo apt upgrade"
alias aptin="sudo apt install"
alias aptrm="sudo apt remove"
alias aptar="sudo apt autoremove"
alias grep='grep --color=auto'
alias ll='ls -AlF --color=auto'
alias la='ls -A --color=auto'
alias ls='ls -CF --color=auto'
alias fetch="neofetch --config $HOME/.config/neofetch/config.conf"
alias neofetch="neofetch --config none"
alias xmas="~/.local/bin/christmas.sh"
alias whichgpu="lspci -k | grep -EA3 'VGA|3D|Display'"
alias hamachi="sudo hamachi"
alias clean="bleachbit -c --preset"
alias fullclean="clean && sudo bleachbit -c --preset"

#alias para void linux
# alias x-i="sudo xbps-install -S"
# alias x-q="xbps-query -Rs"
# alias x-r="sudo xbps-remove -o"
# alias x-u="sudo xbps-install -Su"

###   FI    ###

############################################
###           BASH PWD COMMAND           ###
############################################

# usar esta otra alternativamente, pero no las dos a la vez:
# source $HOME/.bashrc_extra

bash_prompt_command() {
	# How many characters of the $PWD should be kept
	local pwdmaxlen=25

	# Indicate that there has been dir truncation
	local trunc_symbol="..."

	# Store local dir
	local dir=${PWD##*/}

	# Which length to use
	pwdmaxlen=$(( ( pwdmaxlen < ${#dir} ) ? ${#dir} : pwdmaxlen ))

	NEW_PWD=${PWD/#$HOME/\~}
	
	local pwdoffset=$(( ${#NEW_PWD} - pwdmaxlen ))

	# Generate name
	if [ ${pwdoffset} -gt "0" ]
	then
		NEW_PWD=${NEW_PWD:$pwdoffset:$pwdmaxlen}
		NEW_PWD=${trunc_symbol}/${NEW_PWD#*/}
	fi
}

PROMPT_COMMAND=bash_prompt_command

# black=0, red=1, green=2, yellow=3, blue=4, magenta=5, cyan=6, white=7
# https://wiki.bash-hackers.org/scripting/terminalcodes
color1=$(tput setaf 2)
color2=$(tput setaf 1)
bold=$(tput bold)
reset=$(tput sgr0)

# https://askubuntu.com/questions/24358/how-do-i-get-long-command-lines-to-wrap-to-the-next-line
export PS1="\n\[$bold$color1\]@\[$reset\] \[$bold$color2\]\$NEW_PWD\[$reset\] > "

###   FI    ###

############################################
###              CONFIG UNI              ###
############################################

# compilador de C++ para PRO1:
alias p1++="g++ -ansi -O2 -DNDEBUG -D_GLIBCXX_DEBUG -Wall -Wextra -Werror -Wno-sign-compare -Wshadow"
# compilador de C++ para PRO2:
alias p2++="g++ -D_GLIBCXX_DEBUG -O2 -Wall -Wextra -Werror -Wno-sign-compare -std=c++11"

export PRO="$HOME/Documentos/UPC/PRO2"
export INC="$HOME/Documentos/UPC/PRO2/include"
export OBJ="$HOME/Documentos/UPC/PRO2/objects"

alias vp="cd $PRO && nvim"

###   FI    ###

# figlet -f smslant le terminal -t -c | lolcat
