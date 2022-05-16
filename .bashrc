### EXPORT
export VISUAL="emacsclient -c -a 'emacs'"
export EDITOR="nvim"
export ALTERNATE_EDITOR="emacsclient -t -a ''"
export HISTCONTROL=ignoreboth
export alm="/media/vido25/Almacenamiento"
export PATH="${PATH}:${HOME}/.local/bin:${HOME}/.emacs.d/bin"

# ignore upper and lowercase when TAB completion
set completion-ignore-case on

### SHOPT
shopt -s histappend     # do not overwrite history
shopt -s checkwinsize   # checks term size when bash regains control
shopt -s cdspell        # autocorrects cd misspellings

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

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

# run c/c++ file
crun() {
    if [ -f crun ]; then
        ./crun
    else

        __error=$(tput setaf 1)
        __noerror=$(tput setaf 2)
        __info=$(tput setaf 3)
        __advice=$(tput dim)
        __bold=$(tput bold)
        __reset=$(tput sgr0)
#       __data="real time: \t%E \nuser time: \t%U \nsystem time: \t%S \npage faults: \tmajor: %F, minor: %R \nmemory (kb): \t%K"

        echo "${__advice}make sure program is named 'program.exe' and input (if needed) 'inp.txt'...${__reset}"

        if [ -f program.exe ]; then
            # check for makefile
            echo "${__bold}${__info}searching makefile...${__reset}"
            if [ -f Makefile ]; then
                echo "${__bold}${__noerror}file found!${__reset} ${__bold}${__info}comparing modifications...${__reset}"
                make
            else
                echo "${__bold}${__error}file not found!${__reset} ${__bold}${__info}resuming...${__reset}"
            fi

            # check for input file
            echo "${__bold}${__info}searching input file...${__reset}"
            if [ -f inp.txt ]; then 
                echo "${__bold}${__noerror}file found!${__reset} ${__bold}${__info}executing program...${__reset}"
                touch out.txt
#               time -f "${__data}" ./program.exe < inp.txt > out.txt
                ./program.exe < inp.txt > out.txt
                echo "${__bold}${__info}comparing results...${__reset}"
                if [ -f sample_out.txt ]; then
                    meld out.txt sample_out.txt
                else
                    echo "${__bold}${__error}sample output not found!${__reset} ${__bold}${__info}displaying output...${__reset}"
                    cat out.txt
                fi
            else
                echo "${__bold}${__error}file not found!${__reset} ${__bold}${__info}executing program manually...${__reset}"
                ./program.exe
            fi
        else
            # check for makefile
            echo "${__bold}${__error}program not found!${__reset} ${__bold}${__info}searching makefile...${__reset}"
            if [ -f Makefile ]; then
                # check if program compiled
                echo "${__bold}${__noerror}file found!${__reset} ${__bold}${__info}compiling program...${__reset}"
                make
                if [ -f program.exe ]; then
                    crun
                else
                    echo "${__bold}${__error}program did not compile!${__reset} ${__bold}${__info}cannot resume, critical files missing...${__reset}"
                fi
            else
                echo "${__bold}${__error}file not found!${__reset} ${__bold}${__info}cannot resume, critical files missing...${__reset}"
            fi
        fi

    fi
}

###########################################
###               ALIASES               ###
###########################################
# {{{

alias v="nvim"
alias em="emacsclient -t -a ''"
alias aptup="sudo apt update && sudo apt upgrade"
alias aptupd="sudo apt update"
alias aptupg="sudo apt upgrade"
alias aptin="sudo apt install"
alias aptrm="sudo apt remove"
alias aptar="sudo apt autoremove"
alias grep='grep --color=auto'
#alias ll='ls -AlFhG --color=auto --group-directories-first'
#alias la='ls -A --color=auto'
#alias ls='ls -CF --color=auto'
alias ls='exa --icons --group-directories-first --no-time --no-user --color=auto -F'
alias la='exa -a --icons --group-directories-first --no-time --no-user --color=auto -F'
alias ll='exa -l --icons --group-directories-first --no-time --no-user --color=auto -F'
alias fetch="neofetch --config $HOME/.config/neofetch/config.conf"
alias neofetch="neofetch --config none"
alias xmas="~/.local/bin/christmas.sh"
alias whichgpu="lspci -k | grep -EA3 'VGA|3D|Display'"
alias hamachi="sudo hamachi"
alias clean="bleachbit -c --preset"
alias fullclean="clean && sudo bleachbit -c --preset"
alias search="tree -afR $HOME | fzf -e -i --layout=reverse-list --border=rounded --prompt='Buscar: '"
alias weather="curl https://wttr.in/"
alias qbmem='cat "/proc/$(pgrep -f 'bin/qutebrowser')/smaps_rollup"'
alias remake='make clean && make'
alias emacs="emacsclient -c -a 'emacs'"
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

alias wacom-osu='xsetwacom --set "Wacom Intuos PT S 2 Pen stylus" Area 1500 4600 7360 9200'
alias wacom-reset='xsetwacom --set "Wacom Intuos PT S 2 Pen stylus" ResetArea'

alias icat="kitty +kitten icat"
alias diff="kitty +kitten diff"

# }}}

############################################
###           BASH PWD COMMAND           ###
############################################
# {{{

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

# }}}

############################################
###              CONFIG UNI              ###
############################################
# {{{

# Compilador de C++ para PRO1:
alias p1++="g++ -ansi -O2 -DNDEBUG -D_GLIBCXX_DEBUG -Wall -Wextra -Werror -Wno-sign-compare -Wshadow"
# Compilador de C++ para PRO2:
alias p2++="g++ -D_GLIBCXX_DEBUG -O2 -Wall -Wextra -Werror -Wno-sign-compare -std=c++11"

export pro="$HOME/Documentos/UPC/PRO2"
export prac="$pro/practica"
export inc="$HOME/Documentos/UPC/PRO2/include"
export obj="$HOME/Documentos/UPC/PRO2/objects"

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
