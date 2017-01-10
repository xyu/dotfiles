# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything:
[ -z "$PS1" ] && return
shopt -s checkwinsize

# UTF-8
export LANG=en_US.utf8

# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ]; then
	eval "`dircolors -b`"
	alias ll='ls --format=vertical --color=auto -lah'
	#alias dir='ls --color=auto --format=vertical'
	#alias vdir='ls --color=auto --format=long'
fi

# Build a better prompt
__XYU_PROMPT_COMMAND() {
	local EXIT="$?"

	local CRST='\[\e[0m\]'
	local CRED='\[\e[0;31m\]'
	local CGRN='\[\e[0;32m\]'
	local CYEL='\[\e[1;33m\]'
	local CBLU='\[\e[1;34m\]'
	local CBRO='\[\e[0;35m\]'

	PS1="${CBRO}\u${CRST}@${CYEL}\h${CRST}:${CBLU}\W "

	if [ $EXIT != 0 ]; then
		PS1+="${CRED}❯ ${CRST}"
	else
		PS1+="${CGRN}❯ ${CRST}"
	fi
}
case "$TERM" in
xterm*|rxvt*|screen*)
	PROMPT_COMMAND=__XYU_PROMPT_COMMAND
	;;
*)
	;;
esac
true && __XYU_PROMPT_COMMAND && export PS1

# Set path and umask
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
