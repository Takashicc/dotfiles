# Environment setup

## Tools

### Common

Copy common settings.

- [common.sh](./bin/common.sh)

  ```sh
  chmod a+x ./bin/common.sh
  ./bin/common.sh
  ```

### Brewfile

- List all dependencies

  ```sh
  brew bundle dump --file=- | clip
  ```

### VSCode

#### VSCode extensions

- List all extensions

  ```sh
  code --list-extensions | sort | awk '{print "code --install-extension " $0}' | clip
  ```

- Install extensions

  - [vscode_extensions_install.sh](./bin/vscode_extensions_install.sh)

    ```sh
    chmod a+x ./bin/vscode_extensions_install.sh
    ./bin/vscode_extensions_install.sh
    ```

### Commands

- [starship](https://github.com/starship/starship)
  - Customizable prompt
- [zoxide](https://github.com/ajeetdsouza/zoxide)
  - A smarter cd command.
- [lsd](https://github.com/Peltoche/lsd)
  - The next gen ls command
- [bat](https://github.com/sharkdp/bat)
  - A cat(1) clone with syntax highlighting and Git integration
- [volta](https://github.com/volta-cli/volta)
  - Node engine manager
- [rbenv](https://github.com/rbenv/rbenv)
  - Ruby version manager
- [poetry](https://python-poetry.org)
  - Python package and dependency manager
- [goenv](https://github.com/syndbg/goenv)
  - Go Version Management: goenv

### Apps

- [kitty](https://github.com/kovidgoyal/kitty)
  - Cross-platform, fast, feature-rich, GPU based terminal
