{ pkgs, ... }:
{
  homebrew = {
    enable = true;
    # App Store Apps, use `mas search "App Name"` to find app ID
    # masApps = {
    #     "Microsoft Word" = 462054704;
    # };
    brews = [
      "mas" # search app ID
      # latexindent
      "perl"
      "cpanm"
      "ripgrep"
      "cocoapods"
    ];
    # GUI Apps
    casks = [
      "obsidian"
      "zotero"
      "visual-studio-code"
      "raycast"
      "anki"

      "ghostty"
      "zen"
      "discord"
      "spotify"
      "inkscape"
      # inkscape shortcut
      "hammerspoon"
      "karabiner-elements"
      "jordanbaird-ice" # menu bar
      "skim" # pdf reader
      "prismlauncher" # minecraft launcher
      
      "android-studio"
      "intellij-idea"
      "pycharm"
      "latexit"
    ];
    onActivation = {
      autoUpdate = true;
      upgrade = true;
      cleanup = "zap";
    };
  };
}

