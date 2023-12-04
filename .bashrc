# bash options

set completion-ignore-case on
shopt -s histappend
shopt -s checkwinsize
shopt -s cdspell

# completion

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    source /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    source /etc/bash_completion
  fi
fi

# bash insulter

[ -f /etc/bash.command-not-found ] && source /etc/bash.command-not-found

# aliases

alias ls="ls -gGFhN --color=auto --group-directories-first --time-style=+%d-%m-%y"
alias la="ls -gGFhNA --color=auto --group-directories-first --time-style=+%d-%m-%y"
alias lss="ls -I '*.o' -I '*~' -I '*.out' -I '*.bin' -I '*.s' -I '*.txt'"
alias grep='grep --color=auto'
alias clean="bleachbit -c --preset"
alias fullclean="bleachbit -c --preset && sudo bleachbit -c --preset"
alias qmake-qt5="qmake"
alias start-vlime-server="sbcl --load .vim/plugged/vlime/lisp/start-vlime.lisp"

if [[ $- == *i* ]]; then
    alias sbcl="rlwrap sbcl"
    alias csi="rlwrap csi"
fi

alias yt-mp3="yt-dlp --extract-audio --audio-format mp3 "
alias yt-mp4="yt-dlp --format mp4 "
alias yt-best="yt-dlp -f bestvideo+bestaudio "
alias yt-xbest="yt-dlp --extract-audio --audio-format best "

alias wacom-osu='xsetwacom --set "Wacom Intuos PT S 2 Pen stylus" Area 5667 3667 8633 5833'
alias wacom-small='xsetwacom --set "Wacom Intuos PT S 2 Pen stylus" Area 5167 3167 9133 6333'
alias wacom-reset='xsetwacom --set "Wacom Intuos PT S 2 Pen stylus" ResetArea'

alias camaraobs="sudo modprobe v4l2loopback exclusive_caps=1 card_label='CamaraOBS:CamaraOBS'"

# utilities

0file() { curl -F"file=@$1" https://envs.sh ; }    # 0file "file.png"
0pb() { curl -F"file=@-;" https://envs.sh ; }      # echo "text" | 0pb
0url() { curl -F"url=$1" https://envs.sh ; }       # 0url "https://url"
0short() { curl -F"shorten=$1" https://envs.sh ; } # 0short "https://long-url"

restart-emacs-server() {
    killall emacs
    emacs --daemon
}

mergepdfs() {
    gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile=merged.pdf "$@"
}

# variables

export LANGUAGE=es_ES:en_US
export TERMINAL="urxvt"
export EDITOR="vim"
export VISUAL="emacsclient -c -a 'emacs'"
export MYVIMRC="$HOME/.vimrc"

export SAVEHIST=2000
export HISTFILE=~/.local/share/shell/bash_history

color1=$(tput setaf 6)
color2=$(tput setaf 8)
bold=$(tput bold)
reset=$(tput sgr0)

export PS1="\n\[$bold$color1\]\W \[$bold$color2\]$\[$reset\] "
export PS2="\[$bold$color2\]>\[$reset\] "

# git

alias ga="git add"
alias gd="git diff"
alias gs="git status"
alias gp="git push"
alias gcl="git clone"
alias gpl="git pull"
alias gr="git rm -r"
alias grst="git reset --hard HEAD"
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

# interactive startup commands

if [[ $- == *i* ]]; then
	clear
fi

# vi: ft=sh
