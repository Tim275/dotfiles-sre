# Dotfiles

Personal development environment configuration optimized for DevOps/SRE workflows.

## Features

- **Neovim** - Modern IDE experience with 30+ plugins
- **TMUX** - Terminal multiplexer with session management
- **Starship** - Fast, customizable shell prompt
- **AeroSpace** - Tiling window manager for macOS

## Screenshots

<!-- Add your screenshots here -->

## Requirements

- macOS or Linux
- Neovim >= 0.10
- TMUX >= 3.3
- Git
- A [Nerd Font](https://www.nerdfonts.com/) (e.g., JetBrains Mono Nerd)

## Installation

### Clone the Repository

```bash
git clone https://github.com/yourusername/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

### Neovim

```bash
# Backup existing config
mv ~/.config/nvim ~/.config/nvim.bak

# Create symlink
ln -s ~/dotfiles/nvim ~/.config/nvim
```

### TMUX

```bash
# Backup existing config
mv ~/.config/tmux ~/.config/tmux.bak

# Create symlink
ln -s ~/dotfiles/tmux ~/.config/tmux

# Install plugins (inside tmux)
# Press: prefix + I
```

### Starship

```bash
# Backup existing config
mv ~/.config/starship.toml ~/.config/starship.toml.bak

# Create symlink
ln -s ~/dotfiles/starship.toml ~/.config/starship.toml
```

### AeroSpace

```bash
# Backup existing config
mv ~/.config/aerospace ~/.config/aerospace.bak

# Create symlink
ln -s ~/dotfiles/aerospace ~/.config/aerospace
```

## Neovim Setup

### Plugin Manager
[lazy.nvim](https://github.com/folke/lazy.nvim) - Modern plugin manager

### Key Plugins

| Category | Plugin | Description |
|----------|--------|-------------|
| LSP | nvim-lspconfig | Language server protocol |
| Completion | nvim-cmp | Autocompletion engine |
| Syntax | nvim-treesitter | Better syntax highlighting |
| File Nav | nvim-tree | File explorer |
| Fuzzy Find | fzf-lua | Fuzzy finder |
| Git | gitsigns, vim-fugitive | Git integration |
| Motion | flash.nvim | Jump anywhere |
| Bookmarks | harpoon | Quick file navigation |

### LSP Servers (DevOps/SRE Stack)

- **Python**: pyright
- **Go**: gopls
- **YAML**: yamlls (with K8s, Docker Compose, GitHub Actions schemas)
- **Bash**: bashls
- **Terraform**: terraformls
- **Helm**: helm_ls
- **Ansible**: ansiblels
- **Docker**: dockerls

### Custom Snippets

DevOps-focused snippets for:
- Kubernetes manifests
- Docker/Dockerfile
- Terraform
- Python (FastAPI, Boto3, K8s client)
- Go (HTTP server, K8s client)
- Bash scripts

## TMUX Setup

### Plugins

- **tpm** - Plugin manager
- **tmux-resurrect** - Session persistence
- **tmux-continuum** - Auto-save sessions
- **vim-tmux-navigator** - Seamless Vim/TMUX navigation
- **catppuccin** - Theme

### Key Bindings

| Binding | Action |
|---------|--------|
| `Ctrl-a` | Prefix |
| `Ctrl-h/j/k/l` | Navigate panes (also works in Neovim) |
| `prefix + \|` | Split vertical |
| `prefix + -` | Split horizontal |
| `prefix + r` | Reload config |

## Starship Prompt

SRE-optimized prompt showing:

- Kubernetes context & namespace
- Python virtualenv
- Terraform workspace
- AWS profile & region
- Git branch & status
- Command duration (>2s)
- Docker context

## Keymaps Reference

### Neovim Leader Key: `Space`

| Keymap | Action |
|--------|--------|
| `<leader>e` | Toggle file explorer |
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>a` | Add to Harpoon |
| `<leader>h` | Harpoon menu |
| `<leader>lg` | LazyGit |
| `gd` | Go to definition |
| `K` | Hover documentation |
| `<leader>ca` | Code action |
| `<leader>rn` | Rename symbol |

## Acknowledgments

- [radleylewis](https://github.com/radleylewis) - Tutorial inspiration
- [ThePrimeagen](https://github.com/ThePrimeagen) - Harpoon & workflow tips
- [folke](https://github.com/folke) - Amazing Neovim plugins
