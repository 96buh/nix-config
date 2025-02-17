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
    ];
    # GUI Apps
    casks = [
      "obsidian"
      "zotero"
      "visual-studio-code"
      "raycast"
      "zen-browser"
      "discord"
      "spotify"
      "inkscape"
      # inkscape shortcut
      "hammerspoon"
      "karabiner-elements"
      # menu bar manager
      "jordanbaird-ice"
    ];
    onActivation = {
      autoUpdate = true;
      upgrade = true;
      cleanup = "zap";
    };
  };
}

