# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

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

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

#Define colors in an easier-to-use syntax

ESC="$(echo -en '\e')"
BLACK="${ESC}[30m"
RED="${ESC}[31m"
GREEN="${ESC}[32m"
YELLOW="${ESC}[33m"
BLUE="${ESC}[34m"
LIGHTBLUE="${ESC}[1;34m"
PURPLE="${ESC}[35m"
CYAN="${ESC}[36m"
WHITE="${ESC}[37m"
NORMAL="${ESC}[0m"
BOLD="${ESC}[1m"
RESET="${ESC}[0m"

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
#    PS1='\[${BLUE}\]┌───┤\[${RESET}\]${debian_chroot:+($debian_chroot)}\w\[${BLUE}\]├──▶
#\[${BLUE}\]└─╼ \[${RESET}\]'
    PS1='${debian_chroot:+($debian_chroot)}\w\[${BLUE}\] :: \[${RESET}\]'
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

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

# Selfmade Aliases

alias c='clear'
alias h='history'
alias aptin='sudo apt-get install'
alias upgrade='sudo apt upgrade && sudo apt-get update && sudo apt-get autoremove'
alias aliases='sudo emacs ~/.bashrc'
alias r='cd ~/Documents/UWF\ Research/'
alias src='source ~/.bashrc'
alias sf='/home/fullsalvo/Documents/Files/screenfetch-dev -A 'BLAG' -c 15,4 -D Debian'
alias fsch='feh -. --zoom fill -g 938x506'
alias LC='python /home/fullsalvo/Documents/UWF\ Research/LiquidCrystalMain.py'
alias lc='lolcat'
alias i3op='sudo emacs ~/.i3/config'
alias music='ncmpcpp'
alias shutdown='poweroff'
alias nausea='/home/fullsalvo/Documents/Files/nausea/nausea'
alias networks='sudo ls -l /etc/NetworkManager/system-connections/'
alias colors='.bin/colortheme'
alias cupd='xrdb ~/.XResources'
alias scrot='scrot /home/fullsalvo/Pictures/Screenshots/%y-%b-%d_%H%M%S.png'
alias blocks='.bin/candy'
alias apts='apt-cache search'
alias rec="ffmpeg -s 1920x1080 -an -i :0.0 -c:v libvpx -b:v 5M -crf 10 -quality realtime -y -loglevel quiet"
alias fastrec="ffmpeg -f x11grab -s 1920x1080 -an -r 25 -i :0.0 -c:v libvpx -b:v 5M -crf 10 -quality realtime -y -loglevel quiet"
alias info='/home/fullsalvo/.bin/info.sh'
alias fig='figlet'
alias networks='nmcli dev wifi'
alias wifion='nmcli radio wifi on'
alias wifioff='nmcli radio wifi off'
alias color='.bin/colors'
alias block='.bin/blocks'
alias wallview='.bin/wallview'
alias commit='git commit -m "fullsalvo update"'
