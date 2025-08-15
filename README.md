# dotfiles

This repository contains my macOS system configuration using [Nix](https://nixos.org), [nix-darwin](https://github.com/LnL7/nix-darwin).

## Usage

1. Install [Nix](https://nixos.org) package manager.
2. Clone this repository.
3. (First time only) Install nix-darwin and apply configuration:
   ```bash
   nix run nix-darwin --extra-experimental-features 'nix-command flakes' -- switch --flake ~/.dotfiles#macbookpro
   ```
4. (Afterwards) Rebuild configuration:
   ```bash
   darwin-rebuild switch --flake ~/.dotfiles#macbookpro
   ```
