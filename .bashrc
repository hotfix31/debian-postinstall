export HISTTIMEFORMAT="%T %F "
export VISUAL=/usr/bin/vim

alias port='cat /etc/services | grep -i'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias vi='vim'
alias df='df -h'
alias tree='tree -a'

if [ "$TERM" != "dumb" ] && [ -x /usr/bin/dircolors ]; then
        export COLOR_OPTS='--color=auto'
        eval "`dircolors -b`"
        alias ls='ls $COLOR_OPTS'
        alias ll='ls $COLOR_OPTS -lh'
        alias l='ls $COLOR_OPTS -lA'
        alias dir='ls $COLOR_OPTS --format=vertical'
        alias vdir='ls $COLOR_OPTS --format=long'
        alias grep='grep $COLOR_OPTS -i'
        alias fgrep='fgrep $COLOR_OPTS'
        alias egrep='egrep $COLOR_OPTS'
fi

if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

if [ -f ~/.bash_alias ]; then
    . ~/.bash_alias
fi

case "$TERM" in
    xterm) color_prompt=yes;;
    xterm-256color) color_prompt=yes;;
    xterm-color) color_prompt=yes;;
esac

if [ "$color_prompt" = yes ]; then
   PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
   PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

case "$TERM" in
xterm*|rxvt*)
        PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
        ;;
*)
        ;;
esac

