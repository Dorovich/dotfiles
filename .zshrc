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

alias ls="ls -FhN --color=auto"
alias ll="ls -gGFhN --color=auto --time-style=iso"
alias la="ls -FhNA --color=auto --time-style=iso"
alias lla="ls -gGFhNA --color=auto --time-style=iso"
alias lss="ls -I '*.o' -I '*~' -I '*.out' -I '*.bin' -I '*.s' -I '*.txt'"
alias bc="bc -l"
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

alias em="emacs --color=never -nw"

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

vscrot() {
	mode=$1 && shift
	dt=$(date +%s)
	case $mode in
		full)	maim ~/Imágenes/Capturas/captura_$dt.png ;;
		active)	maim -i $(xdotool getactivewindow) ~/Imágenes/Capturas/ventana_$dt.png ;;
		select)	maim -s ~/Imágenes/Capturas/recorte_$dt.png ;;
		copy)	maim -s | xclip -selection clipboard -t image/png ;;
		*)	maim ~/Imágenes/Capturas/captura_$dt.png ;;
	esac
}

# variables

LANGUAGE=es_ES:en_US
TERMINAL="xterm"
EDITOR="vim"
BROWSER="firefox"
VISUAL="emacsclient -c -a 'emacs'"
MYVIMRC="$HOME/.config/vim/vimrc"
# MANPAGER="nvim +Man!"
MANPAGER="sh -c \"col -b | vim -c 'set ft=man' -\""

SAVEHIST=2000
HISTFILE=~/.local/share/shell/zsh_history
HISTCONTROL=ignoreboth:erasedups

# PS1: see «man zshmisc» for parameters
PS1="[%B%F{1}%?%f%b:%B%F{2}%1~%f%b]$ "
PS2="%B%F{8}>%f%b "

export LANGUAGE TERMINAL EDITOR BROWSER VISUAL MYVIMRC MANPAGER
export SAVEHIST HISTFILE HISTCONTROL PS1 PS2

[ -z $SCRIPTSDIR ] && source ~/.profile

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
	_cmd=$1 && shift
	case $_cmd in
		a)	git add $* ;;
		d)	git diff $* ;;
		s)	git status $* ;;
		cl)	git clone $* ;;
		p)	git push $* ;;
		pl)	git pull $* ;;
		l)	git log $* ;;
		c)	git commit -a -m "$*" ;;
		*)	;;
	esac
}

alias config="/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME"

# vi: ft=sh
