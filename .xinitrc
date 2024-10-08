#! /bin/sh

# this allows scrolling in firefox
export MOZ_USE_XINPUT2=1

export PATH=$PATH:/home/ser/dev/scripts

export XCURSOR_SIZE=50

# aliases for eza
alias ls='eza -l'
alias la='eza -la'
alias tree='eza -laT'

alias cd='z'
alias zz='z -'

~/.fehbg & # set background (.fehbg is created by feh)
xsetroot -cursor_name quintom-cursor-theme &
exec xmonad
