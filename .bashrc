# vim: set ts=4 sts=4 sw=4 et:

bash=${BASH_VERSION%.*}; bmajor=${bash%.*}; bminor=${bash#*.}

# bash completion does not work on old versions with failglob set
if [ $bmajor -gt 4 ] || [ $bmajor -eq 4 -a $bminor -gt 2 ]; then
    PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"'
else
    # similar to above but don't escape ~ as older versions of bash
    # don't expand tilda in pattern parameter expansion strings
    PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/~}"'
fi

shopt -s cdspell
shopt -s histappend

export EDITOR=vim
export LESS=-i

PS1='[\u@\h \W]\$ '

alias grep='grep -i --color=auto'
alias ls='ls --color=auto'

. .lbashrc
