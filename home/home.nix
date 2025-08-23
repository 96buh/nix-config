{ config, pkgs, lib, ... }:

let 
  isDarwin = pkgs.stdenv.isDarwin;
in {
  home.username = "homer";
  home.homeDirectory = lib.mkForce(
    if isDarwin then "/Users/homer" else "/home/homer"
  );


  home.sessionPath = [ "$HOME/.local/bin" ];

  home.file.".local/bin/tmux-sessionizer" = {
    source = ./scripts/tmux-sessionizer;
    executable = true;
  };

  # link the configuration file in current directory to the specified location in home directory
  # home.file.".config/i3/wallpaper.jpg".source = ./wallpaper.jpg;
  home.file.".zshrc".source = ./.zshrc;

  # link all files in `./scripts` to `~/.config/i3/scripts`
  # home.file.".config/i3/scripts" = {
  #   source = ./scripts;
  #   recursive = true;   # link recursively
  #   executable = true;  # make all files executable
  # };
  home.file.".config/ohmyposh" = {
    source = ./.config/ohmyposh;
    recursive = true;
  };

  home.file.".config/karabiner" = {
    source = ./.config/karabiner;
    recursive = true;
  };

  home.file.".config/ghostty/config".text = ''
    font-size = 20
    macos-option-as-alt = true
    theme = dark:GruvboxDark,light:GruvboxLight
    window-padding-x = 10
    window-padding-y = 5
    macos-titlebar-style = "hidden"
  '';

  # encode the file content in nix configuration file directly
  # home.file.".xxx".text = ''
  #     xxx
  # '';

  # Packages that should be installed to the user profile.
    #home.packages = with pkgs; [
    #];

  # 設定
  programs = {
    # alacritty = import ./alacritty.nix { inherit pkgs config; };
    git = import ./git.nix { inherit pkgs config; };
    tmux = import ./tmux.nix { inherit pkgs; };
  };


  home.stateVersion = "24.11";
  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
