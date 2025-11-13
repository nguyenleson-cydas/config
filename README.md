# Dotfiles

Personal dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Structure

```
dotfiles/
├── nvim/         # Neovim configuration
├── starship/     # Starship prompt configuration
├── tmux/         # Tmux configuration and plugins
└── zsh/          # Zsh configuration
```

## Prerequisites

- [GNU Stow](https://www.gnu.org/software/stow/)
  - macOS: `brew install stow`
  - Linux: `sudo apt install stow` or `sudo pacman -S stow`

## Installation

### Install all packages

```bash
cd ~/dotfiles
stow nvim starship tmux zsh
```

### Install specific packages

```bash
cd ~/dotfiles
stow nvim    # Install only neovim config
stow zsh     # Install only zsh config
```

### Using the Makefile

```bash
make install         # Install all dotfiles
make install-nvim    # Install specific package
make uninstall       # Remove all symlinks
make restow          # Reinstall (useful after updates)
```

## Uninstallation

### Uninstall all packages

```bash
cd ~/dotfiles
stow -D nvim starship tmux zsh
```

### Uninstall specific package

```bash
cd ~/dotfiles
stow -D nvim    # Remove only neovim symlinks
```

## How It Works

GNU Stow creates symlinks from your home directory to files in this repository. For example:

- `nvim/.config/nvim/init.lua` → `~/.config/nvim/init.lua`
- `zsh/.zshrc` → `~/.zshrc`
- `tmux/.config/tmux/tmux.conf` → `~/.config/tmux/tmux.conf`

This allows you to:
- Version control your dotfiles
- Selectively install configurations
- Easily sync across multiple machines
- Keep your home directory clean

## Configuration

The `.stowrc` file in the root sets default options:
- Target directory: `$HOME`
- Verbose level: 2 (shows what stow is doing)

## Notes

- **nvim**: Uses [LazyVim](https://www.lazyvim.org/) as the base configuration
- **tmux**: Plugins are managed by [TPM (Tmux Plugin Manager)](https://github.com/tmux-plugins/tpm)
- **starship**: Cross-shell prompt with custom configuration

## Troubleshooting

### Conflicts

If stow reports conflicts (existing files), you need to:
1. Backup the existing file
2. Remove the existing file
3. Run stow again

```bash
mv ~/.zshrc ~/.zshrc.backup
stow zsh
```

### Restowing

If you've updated files and want to refresh symlinks:

```bash
stow -R nvim    # Restow neovim
# or
make restow     # Restow everything
```
