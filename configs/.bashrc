# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything:
[ -z "$PS1" ] && return
shopt -s checkwinsize

# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ]; then
    eval "`dircolors -b`"
    alias ll='ls --format=vertical --color=auto -lah'
    #alias dir='ls --color=auto --format=vertical'
    #alias vdir='ls --color=auto --format=long'
fi
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'
    ;;
*)
    ;;
esac
export PS1='\[\033[01;33m\]\u@\H\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
umask 022


export LS_OPTIONS='--color=auto'
eval "`dircolors`"
alias ll='ls $LS_OPTIONS -lah'
alias ls='ls --color=auto'

# Custom aliases
alias reconnect-screen='screen -dRU'

# Maybe load host specific configs
if [ -f ~/.bashrc.host ]; then
	. ~/.bashrc.host
fi
