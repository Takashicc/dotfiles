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
task re-add file=~/.config/mise/config.toml  # import changes from a managed file
task diff                          # preview changes
task apply                         # apply changes
task status                        # show status
```

## Scripts

Scripts under `darwin/dot_local/bin/` land in `~/.local/bin`, which `.zshrc`
puts on `PATH`.

### `mac-cleanup`

Reclaims disk space from developer caches and macOS junk. It always prints the
targets and their current sizes first (`?` for targets that cannot be measured),
then asks before deleting anything.

```sh
mac-cleanup           # clean the default targets, with a confirmation prompt
mac-cleanup -n -a     # dry run over every target, including the extra group
mac-cleanup -l        # list the targets
mac-cleanup -o brew,pnpm -y
```

Default targets are caches that rebuild cheaply: Homebrew, mise, npm, pnpm,
bun, uv, Go build cache, Xcode DerivedData, app-updater leftovers, logs older
than 30 days, and the trash. The `extra` group (`-a`) adds ones that are
pricier to refill or more disruptive: Homebrew's unused formulae, unused mise
tool versions, the Go module cache, Cargo registry, Xcode DeviceSupport and
unavailable simulators, container images and anonymous volumes, browser
caches, AI CLI runtimes, Puppeteer's Chromium, and JetBrains caches.
