# dotfiles

dotfiles for my computer.

```sh
# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# install packages using homebrew
task brewfile-install

# check diff and apply dotfiles using chezmoi
task diff
task apply

# reload .zshrc
source ~/.zshrc

# install tools using mise
# tools are listed in dot_config/mise/config.toml
mise i
```
