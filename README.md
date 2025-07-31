# Nix Home Manager Configuration

A personal Nix flake configuration using Home Manager to provide a consistent development environment with useful tools and settings across different machines.

## Overview

This configuration provides:
- **Neovim** configuration including modern plugins
- **Shell environment** with Zsh, Oh My Zsh, and Powerlevel10k theme
- **Development tools** including Git, Lazygit, and various Unix utilities
- **Nix development** tools and language server
- **Claude Code** integration via Google Vertex AI

## Quick Start

### Prerequisites

1. Install Nix with flakes enabled:
   ```bash
   curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
   ```

2. Ensure you have `git` installed to clone this repository.

### Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/Sarguru02/nix-dots ~/.config/home-manager
   cd ~/.config/home-manager
   ```

2. **Important**: Update the user configuration for your system by editing `configurations/home/sargurunathan.p.nix`:
   ```nix
   me = {
     username = "your-username";     # Replace with your actual username
     fullname = "Your Full Name";    # Replace with your full name
     email = "your@email.com";       # Replace with your email
   };
   ```

3. Activate the configuration:
   ```bash
   nix run
   ```

### For Different Users/Hostnames

If you're not using the hostname `sargurunathan.p`, you have two options:

#### Option 1: Create a new configuration file
Create a new file in `configurations/home/` with your username:
```bash
cp configurations/home/sargurunathan.p.nix configurations/home/your-username.nix
```

Then edit the new file to update your personal information.

#### Option 2: Rename the existing file
```bash
mv configurations/home/sargurunathan.p.nix configurations/home/your-username.nix
```

Then edit the file to update your personal information.

## Available Commands

This project uses [just](https://just.systems/) for task management. Run `just` to see all available commands:

- `just run` - Activate the configuration
- `just update` - Update the flake lock file
- `just check` - Check the flake for errors
- `just lint` - Format Nix files
- `just dev` - Enter development shell

## What's Included

### Shell Environment
- **Zsh** with Oh My Zsh framework
- **Powerlevel10k** theme for beautiful prompts
- **Syntax highlighting** and **autosuggestions**
- **Zoxide** for smart directory jumping (`z` command)
- Shell aliases: `g` for git, `lg` for lazygit

### Development Tools
- **Git** with user configuration and lazygit integration
- **Neovim** with comprehensive NixVim configuration including:
  - Modern colorscheme
  - Mini.nvim plugins (pairs, surround, statusline, ai)
  - Snacks.nvim plugins (dashboard, picker, lazygit)
  - Treesitter for syntax highlighting
- **Unix utilities**: ripgrep, fd, sd, tree, bat, fzf, jq, btop
- **Nix tools**: nil language server, nixpkgs-fmt, omnix, cachix
- **Terminal sharing**: tmate for collaborative sessions
- **Tmux** for terminal multiplexing

### Claude Code Integration
This configuration includes Claude Code setup using Google Vertex AI Platform via the [vertex](https://github.com/juspay/vertex) flake.

## File Structure

```
├── configurations/home/          # Per-user configurations
│   └── sargurunathan.p.nix      # Main user configuration
├── modules/
│   ├── flake/                   # Flake-level modules
│   │   ├── activate-home.nix    # Activation script
│   │   ├── devshell.nix         # Development shell
│   │   └── toplevel.nix         # Top-level flake configuration
│   └── home/                    # Home Manager modules
│       ├── default.nix          # Auto-imports all modules
│       ├── direnv.nix           # Direnv configuration
│       ├── gc.nix               # Garbage collection settings
│       ├── git.nix              # Git and Lazygit setup
│       ├── me.nix               # User information module
│       ├── neovim/              # Neovim configuration
│       ├── nix-index.nix        # Nix package index
│       ├── nix.nix              # Nix settings
│       ├── packages.nix         # Package definitions
│       └── shell.nix            # Shell configuration
├── flake.nix                    # Main flake definition
├── flake.lock                   # Lock file for reproducible builds
└── justfile                     # Task runner commands
```

## Troubleshooting

- If activation fails, ensure your username matches the configuration file name
- Check that Nix flakes are enabled in your Nix configuration
- Run `just check` to validate the flake before activation
- Use `just dev` to enter a development shell for debugging