# zsh options

setopt histignorealldups sharehistory
bindkey -e
stty stop undef

if [[ $- == *i* ]]; then
    autoload -Uz compinit
    compinit
    zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
    zstyle ':completion:*' menu select
fi

# aliases

alias ls="ls -gGFhN --color=auto --group-directories-first --time-style=+%d-%m-%y"
alias la="ls -gGFhNA --color=auto --group-directories-first --time-style=+%d-%m-%y"
alias lss="ls -I '*.o' -I '*~' -I '*.out' -I '*.bin' -I '*.s' -I '*.txt'"
alias grep='grep --color=auto'
alias clean="bleachbit -c --preset"
alias fullclean="bleachbit -c --preset && sudo bleachbit -c --preset"
alias sbcl-rl="rlwrap sbcl"
alias qmake-qt5="qmake"
alias start-vlime-server="sbcl --load .vim/plugged/vlime/lisp/start-vlime.lisp"
alias vim="nvim"

alias yt-mp3="yt-dlp --extract-audio --audio-format mp3 "
alias yt-mp4="yt-dlp --format mp4 "
alias yt-best="yt-dlp -f bestvideo+bestaudio "
alias yt-xbest="yt-dlp --extract-audio --audio-format best "

alias wacom-osu='xsetwacom --set "Wacom Intuos PT S 2 Pen stylus" Area 5667 3667 8633 5833'
alias wacom-small='xsetwacom --set "Wacom Intuos PT S 2 Pen stylus" Area 5167 3167 9133 6333'
alias wacom-reset='xsetwacom --set "Wacom Intuos PT S 2 Pen stylus" ResetArea'

alias camaraobs="sudo modprobe v4l2loopback exclusive_caps=1 card_label='CamaraOBS:CamaraOBS'"

# utilities

function 0file() { curl -F"file=@$1" https://envs.sh ; }    # 0file "file.png"
function 0pb() { curl -F"file=@-;" https://envs.sh ; }      # echo "text" | 0pb
function 0url() { curl -F"url=$1" https://envs.sh ; }       # 0url "https://url"
function 0short() { curl -F"shorten=$1" https://envs.sh ; } # 0short "https://long-url"

function restart-emacs-server() { killall emacs ; emacs --daemon ; }

# variables

export LANGUAGE=es_ES:en_US
export TERMINAL="urxvtc"
export EDITOR="nvim"
export BROWSER="firefox"
export VISUAL="emacsclient -c -a 'emacs'"
export MYVIMRC="$HOME/.vim/vimrc"

export SAVEHIST=2000
export HISTFILE=~/.local/share/shell/zsh_history
export HISTCONTROL=ignoreboth:erasedups

export PS1="%B%F{8}>%f%b " #λ
export PS2="%B%F{8}...%f%b "

# path

# [ -d "$HOME/.bin" ] && PATH="$HOME/.bin:$PATH"
# [ -d "$HOME/.local/bin" ] && PATH="$HOME/.local/bin:$PATH"
# [ -d "$HOME/.local/bin/statusbar" ] && PATH="$HOME/.local/bin/statusbar:$PATH"
# [ -d "$HOME/.local/bin/dmenu" ] && PATH="$HOME/.local/bin/dmenu:$PATH"
# [ -d "$HOME/Applications" ] && PATH="$HOME/Applications:$PATH"
# [ -d "/var/lib/flatpak/exports/bin/" ] && PATH="/var/lib/flatpak/exports/bin/:$PATH"
# [ -d "/opt/bochs_gdb/bin" ] && PATH="/opt/bochs_gdb/bin:$PATH"

# git

alias ga="git add"
alias gd="git diff"
alias gs="git status"
alias gp="git push"
alias gcl="git clone"
alias gpl="git pull"
alias gr="git rm -r --cached"
alias gundo="git reset HEAD~"
alias greset="git reset --hard HEAD"
alias gl='git log --pretty=format:"%C(magenta)%h%Creset -%C(red)%d%Creset %s %C(dim green)(%cr) [%an]" --abbrev-commit -30'

function gc() { git commit -a -m "$*" ; }

function gitstart() {
    echo '1. git init'
    echo '2. git remote add origin <link>'
    echo '3. git branch -M main'
    echo '4. git add <archivos>'
    echo '5. git commit -a -m "mensaje"'
    echo '6. git push -u origin main'
    echo 'recordar contraseña: git config credential.helper store'
    echo 'añadir otro origen: git remote add origin-alt <url>; git push origin-alt main'
}

alias config="/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME"
alias configa="config add"
alias configd="config diff"
alias configs="config status"
alias configp="config push"
alias configpl="config pull"
alias configr="config rm -r --cached"
alias configl='config log --pretty=format:"%C(magenta)%h%Creset -%C(red)%d%Creset %s %C(dim green)(%cr) [%an]" --abbrev-commit -30'

function configc() { config commit -a -m "$*" ; }

function configstart() {
    echo '1. mkdir ~/dotfiles'
    echo '2. git init --bare $HOME/dotfiles'
    echo '3. alias config="/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME"'
    echo '4. config config --local status.showUntrackedFiles no'
    echo 'ver comando "gitstart" para mas info de git'
}

# vi: ft=sh
