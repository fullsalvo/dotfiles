# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

HISTCONTROL=ignoreboth

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=100000
SAVEHIST=100000
HISTFILE=~/.history

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories. #shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# Change the appearance of the prompt, if applicable
if [ -f $HOME/.prompt.sh ]; then
    . ~/.prompt.sh
fi

# Add user-created shell functions
if [ -f $HOME/.bash_functions ]; then
    . ~/.bash_functions
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto -N'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

#Add directories to $PATH
if [ -d $HOME/.bin ]; then
    export PATH="$PATH:$HOME/.bin:$HOME/.local/bin"
fi

# Allow for bash autocompletion
autoload -U compaudit compinit && compinit
autoload -U +X bashcompinit && bashcompinit

# Remove homedir coredumps
ulimit -Sc 0

if [ -f ~/dev/wz-utils/autocomplete ]; then
    . ~/dev/wz-utils/autocomplete
fi

# mpd info
export MPD_HOST=0.0.0.0
export MPD_PORT=6667

# Use fzf in zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Set the stow directory
export STOW_DIR="$HOME/dotfiles"

# Use zsh-autosuggestions
if [ -f $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    . ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
    . ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    fpath=(/home/fullsalvo/.zsh/zsh-completions/src $fpath)
fi

# interactive comments
setopt interactivecomments
