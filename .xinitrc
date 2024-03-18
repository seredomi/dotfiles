#! /bin/sh

# this allows scrolling in firefox
export MOZ_USE_XINPUT2=1

# aliases for exa
alias ls='exa -l'
alias la='exa -la'
alias tree='exa -laT'

alias cd='z'
alias zz='z -'

~/.fehbg & # set background (.fehbg is created by feh)
redshift -l 36.97:127.02 -t 6500:3200 -m randr &
exec xmonad
