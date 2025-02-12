{ pkgs, ... }:
{
  homebrew = {
    enable = true;
    brews = [
      # search app id in app store
      "mas"
      # latexindent
      "perl"
      "cpanm"
    ];
    casks = [
      "obsidian"
      "zotero"
      "visual-studio-code"
      "alacritty"
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

