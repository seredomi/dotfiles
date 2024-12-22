alias lg='lazygit'



# eza aliases. alii ?
alias ls='eza --color=always --group-directories-first'
alias ll='eza -la --octal-permissions --group-directories-first'
alias l='eza -bGF --header --git --color=always --group-directories-first'
alias llm='eza -lbGd --header --git --sort=modified --color=always --group-directories-first' 
alias la='eza --long --all --group --group-directories-first'
alias lx='eza -lbhHigUmuSa@ --time-style=long-iso --git --color-scale --color=always --group-directories-first'
alias lS='eza -1 --color=always --group-directories-first'
alias lt='eza --tree --level=2 --color=always --group-directories-first'
alias l.="eza -a | grep -E '^\.'"
