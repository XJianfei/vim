# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
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

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
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

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

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
#if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
#    . /etc/bash_completion
#fi

function git_branch {
    ref=$(git symbolic-ref HEAD 2> /dev/null) || return;
    echo "("${ref#refs/heads/}") ";
}

set_term_title(){
    echo -en "\033]0;${1/$HOME/\~}\a"
}

function cur_dir {
    #set_term_title `basename $PWD`;
    set_term_title $PWD;
    if [ $PWD == $HOME ]; then
        echo "~";
    else
        echo `basename $PWD`;
    fi
}




function git_since_last_commit {
    now=`date +%s`;
    last_commit=$(git log --pretty=format:%at -1 2> /dev/null) || return;
    seconds_since_last_commit=$((now-last_commit));
    minutes_since_last_commit=$((seconds_since_last_commit/60));
    hours_since_last_commit=$((minutes_since_last_commit/60));
    minutes_since_last_commit=$((minutes_since_last_commit%60));
    echo "${hours_since_last_commit}h${minutes_since_last_commit}m ";
}

function repo_log {
    repo forall -c "git log --pretty=format:\"%C(Red)%h %C(yellow)[%ai] %C(Blue)<%an> %C(reset)%s %C(yellow)[\$REPO_PATH] %C(reset)%n\"" | sed "/^$/d" | sort -k 2
}

PS1_P=`id -nu`
if [ "$PS1_P" == "root" ]; then
    PS1_P="#"
else
    PS1_P="$"
fi
PS1="[\[\033[1;32m\]\w\[\033[0m\]]\[\033[0m\]\[\033[1;36m\]\$(git_branch)\[\033[0;33m\]\[\033[0m\]\$ "
#PS1="[\[\033[1;32m\]\w\[\033[0m\]] \[\033[0m\]\[\033[1;36m\]\$(git_branch)\[\033[0;33m\]\[\033[0m\]${PS1_P} "
# for git
alias gitsw='git show'
alias gitgl='git log --pretty=format:\"%C(Red)%h %C(yellow)[%ai] %C(reset)<%an> %Cgreen%s%Creset\"'
alias gitsl='git show --stat --pretty=format:\"%h %C(yellow)[%ai] %Cblue<%an> %Cgreen%s%Creset\"'
alias gitst='git status'
alias gitdf='git diff'
alias gitco='git checkout'
# remove cache file
alias gitrm='git status -s | sed -n "s/^\sD\s\(.*\)/\1/p" | xargs git rm'

export GREP_OPTIONS="--exclude-dir=.git" 

export PATH=$PATH:`echo $HOME`/bin:

#source /root/.git-completion.bash

export NVM_DIR="/root/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export USE_CCACHE=1
export CCACHE_DIR=/home/jianfei/.cache
export CACHE_UMASK=002
unset CCACHE_HARDLINK
bind -x '"\C-R": READLINE_LINE=$(history | tac | cut -c 8- | percol --query "${READLINE_LINE}") READLINE_POINT='
