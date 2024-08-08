#! /bin/sh

# this allows scrolling in firefox
export MOZ_USE_XINPUT2=1

export PATH=$PATH:/home/ser/dev/scripts

# aliases for exa
# alias ls='exa -l'
# alias la='exa -la'
# alias tree='exa -laT'

# alias cd='z'
# alias zz='z -'

~/.fehbg & # set background (.fehbg is created by feh)
exec xmonad
