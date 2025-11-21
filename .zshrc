# return if not interactive

[[ $- != *i* ]] && return

# zsh options

autoload -Uz compinit
typeset -i updated_at=$(date +'%j' -r ~/.zcompdump 2>/dev/null || stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)
[ $(date +'%j') != $updated_at ] && compinit -i || compinit -C -i

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select

setopt hist_ignore_all_dups hist_reduce_blanks inc_append_history share_history
stty stop undef

# aliases

alias ls="ls -FhN --color=auto"
alias bc="bc -l"
alias grep='grep --color=auto'
alias clean="bleachbit -c --preset"
alias fullclean="bleachbit -c --preset && sudo bleachbit -c --preset"

alias yt-mp3="yt-dlp --extract-audio --audio-format mp3"
alias yt-mp4="yt-dlp --format mp4"
alias yt-best="yt-dlp -f bestvideo+bestaudio"
alias yt-xbest="yt-dlp --extract-audio --audio-format best"

alias wacom-osu='xsetwacom --set "Wacom Intuos PT S 2 Pen stylus" Area 5667 3667 8633 5833'
alias wacom-small='xsetwacom --set "Wacom Intuos PT S 2 Pen stylus" Area 5167 3167 9133 6333'
alias wacom-reset='xsetwacom --set "Wacom Intuos PT S 2 Pen stylus" ResetArea'

alias camaraobs="sudo modprobe v4l2loopback exclusive_caps=1 card_label='CamaraOBS:CamaraOBS'"

alias sbcl="rlwrap sbcl"
alias csi="rlwrap csi"

# utilities

0file() { curl -F"file=@$1" https://envs.sh ; }    # 0file "file.png"
0pb() { curl -F"file=@-;" https://envs.sh ; }      # echo "text" | 0pb
0url() { curl -F"url=$1" https://envs.sh ; }       # 0url "https://url"
0short() { curl -F"shorten=$1" https://envs.sh ; } # 0short "https://long-url"

# variables

LANGUAGE=es_ES:en_US
TERMINAL="xterm"
EDITOR="vim"
BROWSER="firefox"
VISUAL="emacs"
MYVIMRC="$HOME/.config/vim/vimrc"
MANPAGER="sh -c \"col -b | vim -c 'set ft=man' -\"" # "nvim +Man!"
HISTSIZE=2000
SAVEHIST=$HISTSIZE
HISTFILE=~/.local/share/shell/zsh_history
PS1=";"

export LANGUAGE TERMINAL EDITOR BROWSER VISUAL MYVIMRC MANPAGER SAVEHIST HISTSIZE HISTFILE PS1 # PS2

[ -z $SCRIPTSDIR ] && source ~/.profile

# git

alias config="/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME"

# vi: ft=sh
