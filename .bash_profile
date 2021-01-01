# vim: set ts=2 sts=2 sw=2 et:

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  exec sway
fi

. .bashrc
