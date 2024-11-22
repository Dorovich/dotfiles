# return if not interactive

[[ $- != *i* ]] && return

# zsh options

autoload -Uz compinit
compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select
clear

setopt histignorealldups sharehistory
bindkey -e
stty stop undef

# aliases

alias ls="ls -gGFhN --color=auto --group-directories-first --time-style=+%d-%m-%y"
alias la="ls -gGFhNA --color=auto --group-directories-first --time-style=+%d-%m-%y"
alias lss="ls -I '*.o' -I '*~' -I '*.out' -I '*.bin' -I '*.s' -I '*.txt'"
alias grep='grep --color=auto'
alias clean="bleachbit -c --preset"
alias fullclean="bleachbit -c --preset && sudo bleachbit -c --preset"
alias byebye="shutdown -h now"

alias yt-mp3="yt-dlp --extract-audio --audio-format mp3 "
alias yt-mp4="yt-dlp --format mp4 "
alias yt-best="yt-dlp -f bestvideo+bestaudio "
alias yt-xbest="yt-dlp --extract-audio --audio-format best "

alias wacom-osu='xsetwacom --set "Wacom Intuos PT S 2 Pen stylus" Area 5667 3667 8633 5833'
alias wacom-small='xsetwacom --set "Wacom Intuos PT S 2 Pen stylus" Area 5167 3167 9133 6333'
alias wacom-reset='xsetwacom --set "Wacom Intuos PT S 2 Pen stylus" ResetArea'

alias camaraobs="sudo modprobe v4l2loopback exclusive_caps=1 card_label='CamaraOBS:CamaraOBS'"

alias em="emacs -nw"

alias sbcl="rlwrap sbcl"
alias csi="rlwrap csi"

# utilities

0file() { curl -F"file=@$1" https://envs.sh ; }    # 0file "file.png"
0pb() { curl -F"file=@-;" https://envs.sh ; }      # echo "text" | 0pb
0url() { curl -F"url=$1" https://envs.sh ; }       # 0url "https://url"
0short() { curl -F"shorten=$1" https://envs.sh ; } # 0short "https://long-url"

mergepdfs() {
    gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile=merged.pdf "$@"
}

# variables

export LANGUAGE=es_ES:en_US
export TERMINAL="urxvt"
export EDITOR="nvim"
export BROWSER="firefox"
export VISUAL="emacsclient -c -a 'emacs'"
export MYVIMRC="$HOME/.vim/vimrc"
export MANPAGER="nvim +Man!"

export SAVEHIST=2000
export HISTFILE=~/.local/share/shell/zsh_history
export HISTCONTROL=ignoreboth:erasedups

export PS1="%B%F{6}%1~ %F{8}%%%f%b " #λ
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

g() {
	cmd=$1
	shift
	case $cmd in
		a) git add $* ;;
		d) git diff $* ;;
		s) git status $* ;;
		cl) git clone $* ;;
		pl) git pull $* ;;
		l) git log $* ;;
		c) git commit -a -m "$*" ;;
		*) ;;
	esac
}

alias config="/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME"
alias configa="config add"
alias configd="config diff"
alias configs="config status"
alias configp="config push"
alias configpl="config pull"
alias configr="config rm -r --cached"
alias configl='config log --pretty=format:"%C(magenta)%h%Creset -%C(red)%d%Creset %s %C(dim green)(%cr) [%an]" --abbrev-commit -30'

configc() { config commit -a -m "$*" ; }

# vi: ft=sh
