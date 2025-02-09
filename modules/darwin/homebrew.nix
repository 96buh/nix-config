{ pkgs, ... }:
{
  homebrew = {
    enable = true;
    brews = [
      "mas"
      "perl"
      "cpanm"
    ];
    casks = [
      "obsidian"
      "zen-browser"
      "alacritty"
      "discord"
      "raycast"
      "visual-studio-code"
      "zotero"
      "spotify"
      "inkscape"
    ];
    onActivation.cleanup = "zap";
  };
}

