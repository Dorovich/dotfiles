setopt histignorealldups sharehistory interactive_comments
bindkey -e
stty stop undef

export LANGUAGE=es_ES:en_US
export TERMINAL="st"
export EDITOR="vim"
export VISUAL="emacsclient -c -a 'emacs'"
export ALTERNATE_EDITOR="emacsclient -t -a ''"
export HISTSIZE=2000
export SAVEHIST=2000
export HISTFILE=~/.zsh_history
export MYVIMRC="$HOME/.vimrc"
export HISTORY_IGNORE="(ls|pwd|exit)"

# Vimb config
export JavaScriptCoreUseJIT="0"
export WEBKIT_DISABLE_COMPOSITING_MODE=1

# Qutebrowser stuff
export QUTE_QT_WRAPPER=PyQt6

# Prompt
export PS1="
%B%F{3}%1~%f %F{8}λ%f%b "
export PS2="%B%F{8}>%f%b "

export vrchat_cache="/home/vido25/.steam/debian-installation/steamapps/compatdata/438100/pfx/drive_c/users/steamuser/AppData/LocalLow/VRChat/VRChat"

###########################################
###               ALIASES               ###
###########################################
# {{{

alias v="vim"
alias em="emacsclient -t"
alias grep='grep --color=auto'
alias ls='exa --icons --group-directories-first --no-time --no-user --color=auto -F'
alias la='exa -a --icons --group-directories-first --no-time --no-user --color=auto -F'
alias ll='exa -l --icons --group-directories-first --no-time --no-user --color=auto -F'
alias whichgpu="lspci -k | grep -EA3 'VGA|3D|Display'"
#alias hamachi="sudo hamachi"
alias clean="bleachbit -c --preset"
alias fullclean="bleachbit -c --preset && sudo bleachbit -c --preset"
alias weather="curl https://wttr.in/"
alias myip="ip -c a"
alias emacsc="emacsclient -c -a 'emacs'"
alias mp="ncmpcpp"
alias sbcl-rl="rlwrap sbcl"

alias yt-mp3="yt-dlp --extract-audio --audio-format mp3 "
alias yt-mp4="yt-dlp --format mp4 "
alias yt-best="yt-dlp -f bestvideo+bestaudio "
alias yt-xbest="yt-dlp --extract-audio --audio-format best "

alias wacom-osu='xsetwacom --set "Wacom Intuos PT S 2 Pen stylus" Area 5667 3667 8633 5833'
alias wacom-small='xsetwacom --set "Wacom Intuos PT S 2 Pen stylus" Area 5167 3167 9133 6333'
alias wacom-reset='xsetwacom --set "Wacom Intuos PT S 2 Pen stylus" ResetArea'

alias qmake-qt5="qmake"
alias vlime-server="sbcl --load .vim/plugged/vlime/lisp/start-vlime.lisp"

function 0file() { curl -F"file=@$1" https://envs.sh ; }    # 0file "file.png"
function 0pb() { curl -F"file=@-;" https://envs.sh ; }      # echo "text" | 0pb
function 0url() { curl -F"url=$1" https://envs.sh ; }       # 0url "https://url"
function 0short() { curl -F"shorten=$1" https://envs.sh ; } # 0short "https://long-url"

function default-fm() {
    if [ $1 ]; then
    xdg-mime default $1.desktop inode/directory application/x-gnome-saved-search
    else
        echo "Specify file manager name"
        echo "eg. pcmanfm, nemo"
    fi
}

function mergepdfs() {
    gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile=mergedpdfs.pdf "$@"
}

alias camaraobs="sudo modprobe v4l2loopback exclusive_caps=1 card_label='CamaraOBS:CamaraOBS'"

# }}}

###########################################
###                 PATH                ###
###########################################
# {{{

if [ -d "$HOME/.bin" ] ;
  then PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/.local/bin/statusbar" ] ;
  then PATH="$HOME/.local/bin/statusbar:$PATH"
fi

if [ -d "$HOME/.local/bin/dmenu" ] ;
  then PATH="$HOME/.local/bin/dmenu:$PATH"
fi

if [ -d "$HOME/.emacs.d/bin" ] ;
  then PATH="$HOME/.emacs.d/bin:$PATH"
fi

if [ -d "$HOME/Applications" ] ;
  then PATH="$HOME/Applications:$PATH"
fi

if [ -d "/var/lib/flatpak/exports/bin/" ] ;
  then PATH="/var/lib/flatpak/exports/bin/:$PATH"
fi

if [ -d "$HOME/.vim/bin" ] ;
  then PATH="$HOME/.vim/bin:$PATH"
fi

# }}}

############################################
###                 GIT                  ###
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

function gc() {
    git commit -a -m "$*"
}

function gitstart() {
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

function configc() {
    config commit -a -m "$*" 
}

function configstart() {
    echo '1. mkdir ~/dotfiles'
    echo '2. git init --bare $HOME/dotfiles'
    echo '3. alias config="/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME"'
    echo '4. config config --local status.showUntrackedFiles no'
    echo 'ver comando "gitstart" para mas info de git'
}

# }}}

############################################
###             COMPLETION               ###
############################################
# {{{

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# }}}

# Fuente: https://github.com/zsh-users/zsh-syntax-highlighting
source ~/.config/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

if [ -e /home/vido25/.nix-profile/etc/profile.d/nix.sh ]; then . /home/vido25/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
