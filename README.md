# dotfiles

Dotfiles managed with [chezmoi](https://www.chezmoi.io/), split by OS:

- `darwin/` — macOS source tree
- `linux/` — Linux source tree (scaffold only, not yet populated)

Each machine points chezmoi at its OS-specific subdirectory via `sourceDir`
in `~/.config/chezmoi/chezmoi.toml`.

## macOS bootstrap

```sh
# 1. Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# 2. Install mise, chezmoi and ghq via Homebrew
#    (chezmoi must exist before it can apply mise's config.toml, which also
#    lists chezmoi as a managed tool - this bootstraps the chicken-and-egg)
brew install mise chezmoi ghq

# 3. Clone this repo
ghq get https://github.com/Takashicc/dotfiles.git

# 4. Point chezmoi at the darwin/ source tree
mkdir -p ~/.config/chezmoi
cat > ~/.config/chezmoi/chezmoi.toml <<'EOF'
sourceDir = "/Users/<you>/Desktop/ghq/github.com/Takashicc/dotfiles/darwin"
EOF
# Replace the path above with the literal absolute path to darwin/ on this machine.

# 5. Review and apply
chezmoi diff
chezmoi apply

# 6. Reload shell
source ~/.zshrc

# 7. Install the rest of the toolchain via mise
mise install
source ~/.zshrc
```

## Linux bootstrap

Not yet available — `linux/` is a placeholder. See `linux/README.md`.

## Day-to-day usage

Prefer the Task wrappers over calling chezmoi directly:

```sh
task add file=~/.some/new/config   # register a new file
task diff                          # preview changes
task apply                         # apply changes
task status                        # show status
```
