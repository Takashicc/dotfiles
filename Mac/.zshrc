eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

alias x86='arch -x86_64 zsh'
alias arm='arch -arm64 zsh'
alias ls='lsd'
alias l='lsd -l'
alias la='lsd -al'
alias cd='z'
alias python='python3'
alias cat='bat'
alias cls='clear'

export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
export VOLTA_HOME=~/.volta
export PYENV_ROOT=~/.pyenv
export PATH=$PATH:~/go/bin:$VOLTA_HOME/bin:$PYENV_ROOT/bin:~/.rbenv/bin
export GPG_TTY=$(tty)
export BASH_SILENCE_DEPRECATION_WARNING=1

eval "$(rbenv init -)"
eval "$(pyenv init -)"

zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' '+m:{[:upper:]}={[:lower:]}'
autoload -U compinit && compinit
