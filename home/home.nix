{ config, pkgs, lib, ... }:

{
  home.username = "homer";
  home.homeDirectory = lib.mkForce "/Users/homer";

  # link the configuration file in current directory to the specified location in home directory
  # home.file.".config/i3/wallpaper.jpg".source = ./wallpaper.jpg;
  home.file.".zshrc".source = ./.zshrc;

  # link all files in `./scripts` to `~/.config/i3/scripts`
  # home.file.".config/i3/scripts" = {
  #   source = ./scripts;
  #   recursive = true;   # link recursively
  #   executable = true;  # make all files executable
  # };
  home.file.".config/alacritty" = {
    source = ./.config/alacritty;
    recursive = true;
  };
  home.file.".config/gh" = {
    source = ./.config/gh;
    recursive = true;
  };
  home.file.".config/nvim" = {
    source = ./.config/nvim;
    recursive = true;
  };
  home.file.".config/ohmyposh" = {
    source = ./.config/ohmyposh;
    recursive = true;
  };

  # encode the file content in nix configuration file directly
  # home.file.".xxx".text = ''
  #     xxx
  # '';


  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
  ];

  # basic configuration of git, please change to your own
#  programs.git = {
#    enable = true;
#    userName = "Ryan Yin";
#    userEmail = "xiaoyin_c@qq.com";
#  };


  # alacritty - a cross-platform, GPU-accelerated terminal emulator
 # programs.alacritty = {
 #   enable = true;
 #   # custom settings
 #   settings = {
 #     env.TERM = "xterm-256color";
 #     font = {
 #       size = 12;
 #       draw_bold_text_with_bright_colors = true;
 #     };
 #    scrolling.multiplier = 5;
 #    selection.save_to_clipboard = true;
 #  };
 # };

  home.stateVersion = "24.11";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
