#!/bin/bash
# vim: set ts=4 sts=4 sw=4 et:

keyboard="1:1:AT_Translated_Set_2_keyboard"
current=''
if [ -f ~/.current-keyboard ]
then
    current=`cat ~/.current-keyboard`
fi

if [ x$current = x ] || [ $current = 'colemak' ]
then
    swaymsg "input \"$keyboard\" xkb_variant \",\""
    echo qwerty > ~/.current-keyboard
else
    swaymsg "input \"$keyboard\" xkb_variant \"colemak,\""
    echo colemak > ~/.current-keyboard
fi
