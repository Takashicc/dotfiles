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
alias code='cursor'
alias rm='trash-put'

export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
export VOLTA_HOME=~/.volta
export QT5_BIN=/opt/homebrew/opt/qt@5/bin
export RUST_BIN=~/.cargo/bin
export PATH=$PATH:~/go/bin:$VOLTA_HOME/bin:/bin:~/.rbenv/bin:$QT5_BIN:$RUST_BIN:~/local/bin
export GPG_TTY=$(tty)
export BASH_SILENCE_DEPRECATION_WARNING=1
export AWS_DEFAULT_REGION=ap-northeast-1

eval "$(rbenv init -)"
eval "$(fzf --zsh)"

zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' '+m:{[:upper:]}={[:lower:]}'
autoload -U compinit && compinit

alias awsp=aws_switch_profile
function aws_switch_profile() {
    export AWS_PROFILE=$(aws configure list-profiles | fzf)
}

function repo() {
  local repo_dir
  repo_dir=$(ghq list | fzf --preview "bat --color=always --style=header,grid --line-range :80 $(ghq root)/{}/README.*")
  if [[ -n "$repo_dir" ]]; then
    cd "$(ghq root)/$repo_dir" || return
  fi
}
alias repo=repo
