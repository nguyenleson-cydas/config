# Dotfiles

## Prerequisites

- [GNU Stow](https://www.gnu.org/software/stow/)
  - macOS: `brew install stow`
  - Linux: `sudo apt install stow` or `sudo pacman -S stow`

## Installation

### Using the Makefile

**Available packages:** `nvim`, `starship`, `tmux`, `zsh`, `lazygit`, `ghostty`, `scripts`

```bash
make install              # Install all dotfiles
make install-nvim         # Install specific package
```

**Other useful commands:**

```bash
make check                # Check for conflicts before installing
make help                 # Show all available targets
```

## Uninstallation

### Using the Makefile

```bash
make uninstall            # Uninstall all dotfiles
make uninstall-nvim       # Uninstall specific package
```

**Other useful commands:**

```bash
make restow               # Reinstall all dotfiles (useful after updates)
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
