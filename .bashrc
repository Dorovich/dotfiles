# exit if not interactive

[[ $- != *i* ]] && return

# bash options

set completion-ignore-case on
shopt -s histappend
shopt -s checkwinsize
shopt -s cdspell

# completion

if ! shopt -oq posix; then
	comp=/usr/share/bash-completion/bash_completion
	comp_alt=/etc/bash_completion
	[ -f $comp ] && source $comp || source $comp_alt
fi

#source /usr/share/bash-completion/completions/herbstclient

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
VISUAL="emacsclient -c -a 'emacs'"
MYVIMRC="$HOME/.config/vim/vimrc"
# MANPAGER="nvim +Man!"
MANPAGER="sh -c \"col -b | vim -c 'set ft=man' -\""

SAVEHIST=2000
HISTFILE=~/.local/share/shell/bash_history
HISTCONTROL=ignoreboth:erasedups

red=$(tput setaf 1)
green=$(tput setaf 2)
gray=$(tput setaf 8)
bold=$(tput bold)
reset=$(tput sgr0)

PS1="[\[$bold$red\]$?\[$reset\]:\[$bold$green\]\w\[$reset\]]$ "
PS2="\[$bold$gray\]>\[$reset\] "

if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
	debian_chroot=$(cat /etc/debian_chroot)
fi

case "$TERM" in
	st*|xterm*|rxvt*)
		PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
		;;
	*)
		;;
esac

export LANGUAGE TERMINAL EDITOR BROWSER VISUAL MYVIMRC MANPAGER
export SAVEHIST HISTFILE HISTCONTROL PS1 PS2

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
