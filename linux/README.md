# linux (scaffold)

This directory is a placeholder for the Linux chezmoi source tree. It
intentionally has no content yet — dotfiles for Linux have not been authored.

When ready, mirror the `darwin/` layout here (`dot_*` files, a
`.chezmoiignore`, etc.) and point the Linux machine's
`~/.config/chezmoi/chezmoi.toml` at this directory via `sourceDir`.

Do not add a `.chezmoiroot` file to this repo — OS separation is handled
per-machine via `sourceDir`, not via a repo-wide root pointer.
