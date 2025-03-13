{ config, self, nixpkgs, targetSystem, ... }:
let
  pkgs = nixpkgs.legacyPackages.${targetSystem};
in
{
  users.users.homer = {
    home = /Users/homer;
    # home = if targetSystem == "x86_64-linux" then "/home/nixos" else "/Users/homer";
  };

  # environment.darwinConfig = "$HOME/.dotfiles/configuration.nix";
  # 基本 Nix 配置
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = "nix-command flakes";
  system.configurationRevision = self.rev or self.dirtyRev or null;
  # system.stateVersion = 6;
  nixpkgs.hostPlatform = targetSystem;
}

