# vim: set ts=4 sts=4 sw=4 et:

bash=${BASH_VERSION%.*}; bmajor=${bash%.*}; bminor=${bash#*.}

# bash completion does not work on old versions with failglob set
if [ $bmajor -gt 4 ] || [ $bmajor -eq 4 -a $bminor -gt 2 ]; then
    shopt -s failglob
fi

shopt -s cdspell
shopt -s histappend

export EDITOR=vim
export LESS=-i

alias grep='grep -i'
