if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' '+m:{[:upper:]}={[:lower:]}'
  autoload -Uz compinit
  compinit
fi

source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export ZPLUG_HOME=/opt/homebrew/opt/zplug
source $ZPLUG_HOME/init.zsh

source "$HOME/.rye/env"

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
eval "$(goenv init -)"
export PATH="$GOROOT/bin:$PATH"
export PATH="$PATH:$GOPATH/bin"

alias x86='arch -x86_64 zsh'
alias arm='arch -arm64 zsh'
alias ls='lsd'
alias l='lsd -l'
alias la='lsd -al'
alias cd='z'
alias python='python3'
alias cat='bat'
alias cls='clear'
alias clip='pbcopy'
alias pip='pip3'
alias skitty="kitty +kitten ssh"
alias rm='trash-put'

export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
export VOLTA_HOME=~/.volta
export PYENV_ROOT=~/.pyenv
export QT5_BIN=/opt/homebrew/opt/qt@5/bin
export RUST_BIN=~/.cargo/bin
export PATH=$PATH:~/go/bin:$VOLTA_HOME/bin:$PYENV_ROOT/bin:~/.rbenv/bin:$QT5_BIN:$RUST_BIN
export GPG_TTY=$(tty)
export BASH_SILENCE_DEPRECATION_WARNING=1
export AWS_DEFAULT_REGION=ap-northeast-1

eval "$(rbenv init -)"
eval "$(pyenv init -)"

zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' '+m:{[:upper:]}={[:lower:]}'
autoload -U compinit && compinit

alias awsp=aws_switch_profile
function aws_switch_profile() {
    PROFILES=$(aws configure list-profiles)
    PROFILES_ARRAY=($(echo $PROFILES))
    SELECTED_PROFILE=$(echo $PROFILES | peco)
    [[ -n ${PROFILES_ARRAY[(re)${SELECTED_PROFILE}]} ]] && export AWS_PROFILE=${SELECTED_PROFILE}; echo "Switch to ${SELECTED_PROFILE} profile"
}
