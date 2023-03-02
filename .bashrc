### GLOBAL VARS
export LANGUAGE=es_ES:en_US
export TERMINAL="st"
export EDITOR="nvim"
export VISUAL="emacsclient -c -a 'emacs'"
export ALTERNATE_EDITOR="emacsclient -t -a ''"
export HISTCONTROL=ignoreboth
export HISTSIZE=2000
export PATH="${PATH}:${HOME}/.local/bin:${HOME}/.emacs.d/bin:${HOME}/Applications"
export MYVIMRC="$HOME/.config/nvim/init.lua"

export alm="/media/vido25/Almacenamiento"
export mus="$alm/Musica/"

# VIMB config
export JavaScriptCoreUseJIT="0"
export WEBKIT_DISABLE_COMPOSITING_MODE=1

# NNN config
export NNN_PLUG='d:dragdrop;i:imgur;p:preview-tabbed;n:nuke'
export NNN_FIFO='/tmp/nnn.fifo'
export NNN_OPENER='/home/vido25/.config/nnn/plugins/nuke'
export NNN_BMS='h:/home/vido25;a:/media/vido25/Almacenamiento;d:/home/vido25/Descargas;m:/media/vido25/Almacenamiento/Musica;c:/home/vido25/.config;s:/home/vido25/.srcconfig;l:/home/vido25/.local;e:/home/vido25/Documentos/UPC/EDA'
export NNN_COLORS='#03040102;3412'
export NNN_FCOLORS='c1e2040a006033f7c6d6ab01'
export NNN_TMPFILE='/tmp/.lastd'
export NNN_OPTS='R'

# ignore upper and lowercase when TAB completion
set completion-ignore-case on

### SHOPT
shopt -s histappend     # do not overwrite history
shopt -s checkwinsize   # checks term size when bash regains control
shopt -s cdspell        # autocorrects cd misspellings
#set -o vi               # vi keybinds
#bind '"jk":vi-movement-mode' # salir con jk del modo insertar (activar SOLO SI SE ACTIVA EL MODO VI)

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

### BASH INSULTER
# https://gitlab.com/dwt1/bash-insulter
if [ -f /etc/bash.command-not-found ]; then
    . /etc/bash.command-not-found
fi

###########################################
###               ALIASES               ###
###########################################
# {{{

alias v="nvim"
alias vt="/usr/bin/vim.tiny"
alias em="emacsclient -t"
alias aptup="sudo apt update && sudo apt upgrade"
alias aptupd="sudo apt update"
alias aptupg="sudo apt upgrade"
alias aptar="sudo apt autoremove"
alias aptin="sudo apt install"
alias aptrm="sudo apt remove"
alias grep='grep --color=auto'
#alias ll='ls -AlFhG --color=auto --group-directories-first'
#alias la='ls -A --color=auto'
#alias ls='ls -CF --color=auto'
alias ls='exa --icons --group-directories-first --no-time --no-user --color=auto -F'
alias la='exa -a --icons --group-directories-first --no-time --no-user --color=auto -F'
alias ll='exa -l --icons --group-directories-first --no-time --no-user --color=auto -F'
alias fetch="neofetch --config $HOME/.config/neofetch/config.conf"
alias neofetch="neofetch --config none"
alias whichgpu="lspci -k | grep -EA3 'VGA|3D|Display'"
alias hamachi="sudo hamachi"
alias clean="bleachbit -c --preset"
alias fullclean="bleachbit -c --preset && sudo bleachbit -c --preset"
alias search="tree -afR $HOME | fzf -e -i --layout=reverse-list --border=rounded --prompt='Buscar: '"
alias weather="curl https://wttr.in/"
alias qbmem='cat "/proc/$(pgrep -f 'bin/qutebrowser')/smaps_rollup"'
alias myip="ip -c a"
alias remake='make clean && make'
alias emacsc="emacsclient -c -a 'emacs'"
alias mp="ncmpcpp"

alias yt-mp3="yt-dlp --extract-audio --audio-format mp3 "
alias yt-mp4="yt-dlp --format mp4 "
alias yt-best="yt-dlp -f bestvideo+bestaudio "
alias yt-xbest="yt-dlp --extract-audio --audio-format best "

cdl() { cd $1 && ls ; }
0file() { curl -F"file=@$1" https://envs.sh ; }    # 0file "file.png"
0pb() { curl -F"file=@-;" https://envs.sh ; }      # echo "text" | 0pb
0url() { curl -F"url=$1" https://envs.sh ; }       # 0url "https://url"
0short() { curl -F"shorten=$1" https://envs.sh ; } # 0short "https://long-url"

alias wacom-osu='xsetwacom --set "Wacom Intuos PT S 2 Pen stylus" Area 5667 3667 8633 5833'
#alias wacom-osu='xsetwacom --set "Wacom Intuos PT S 2 Pen stylus" Area 5167 3167 9133 6333'
alias wacom-reset='xsetwacom --set "Wacom Intuos PT S 2 Pen stylus" ResetArea'

alias icat="kitty +kitten icat"
alias diff="kitty +kitten diff"

default-fm() {
    if [ $1 ]; then
    xdg-mime default $1.desktop inode/directory application/x-gnome-saved-search
    else
        echo "Specify file manager name"
        echo "eg. pcmanfm, nemo"
    fi
}

mergepdfs() {
    gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile=mergedpdfs.pdf "$@"
}

# }}}

############################################
###                PROMPT                ###
############################################
# {{{

# black=0, red=1, green=2, yellow=3, blue=4, magenta=5, cyan=6, white=7
# https://wiki.bash-hackers.org/scripting/terminalcodes
color1=$(tput setaf 3)
color2=$(tput setaf 8)
bold=$(tput bold)
reset=$(tput sgr0)

export PS1="\n\[$bold$color1\]\W \[$bold$color2\]$\[$reset\] "
export PS2="\[$bold$color2\]>\[$reset\] "

# }}}

############################################
###              CONFIG UNI              ###
############################################
# {{{

# Compilador de C++ para PRO1:
alias p1++="g++ -ansi -O2 -DNDEBUG -D_GLIBCXX_DEBUG -Wall -Wextra -Werror -Wno-sign-compare -Wshadow"
# Compilador de C++ para PRO2:
alias p2++="g++ -D_GLIBCXX_DEBUG -O2 -Wall -Wextra -Werror -Wno-sign-compare -std=c++11"

#export pro="$HOME/Documentos/UPC/PRO2"
#export prac="$pro/practica"
#export inc="$HOME/Documentos/UPC/PRO2/include"
#export obj="$HOME/Documentos/UPC/PRO2/objects"

# }}}

############################################
###                  GIT                 ###
############################################
# {{{

alias ga="git add"
alias gd="git diff"
alias gs="git status"
alias gp="git push"
alias gcl="git clone"
alias gpl="git pull"
alias gr="git rm -r"
alias grs="git reset --hard HEAD"
alias gl='git log --pretty=format:"%C(magenta)%h%Creset -%C(red)%d%Creset %s %C(dim green)(%cr) [%an]" --abbrev-commit -30'

gc() {
    git commit -a -m "$*"
}

gitstart() {
    echo '1. git init'
    echo '2. git remote add origin <link>'
    echo '3. git branch -M main'
    echo '4. git add <archivos>'
    echo '5. git commit -a -m "mensaje"'
    echo '6. git push -u origin main'
    echo 'recordar contraseña: git config credential.helper store'
}

### DOTFILES ==>

alias config="/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME"
alias configa="config add"
alias configd="config diff"
alias configs="config status"
alias configp="config push"
alias configpl="config pull"
alias configr="config rm -r"
alias configl='config log --pretty=format:"%C(magenta)%h%Creset -%C(red)%d%Creset %s %C(dim green)(%cr) [%an]" --abbrev-commit -30'

configc() {
    config commit -a -m "$*" 
}

configstart() {
    echo '1. mkdir ~/dotfiles'
    echo '2. git init --bare $HOME/dotfiles'
    echo '3. alias config="/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME"'
    echo '4. config config --local status.showUntrackedFiles no'
    echo 'ver comando "gitstart" para mas info de git'
}

# }}}
