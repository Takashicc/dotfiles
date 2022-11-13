eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

alias ls='lsd'
alias l='lsd -l'
alias la='lsd -al'
alias cd='z'
alias python='python3'
alias cat='bat'
alias cls='clear'

export GPG_TTY=$(tty)
export BASH_SILENCE_DEPRECATION_WARNING=1
