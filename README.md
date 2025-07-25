# dotfiles

dotfiles for my computer.

```sh
# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# install packages using homebrew
brew bundle --file dot_Brewfile

# check diff and apply dotfiles using chezmoi
chezmoi -S . diff
chezmoi -S . apply

# reload .zshrc
source ~/.zshrc

# install tools using mise
# tools are listed in dot_config/mise/config.toml
mise i

# reload .zshrc
source ~/.zshrc
```
