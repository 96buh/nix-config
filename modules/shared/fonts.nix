{ pkgs, ... }:
let 
  nerdFonts = pkgs.nerd-fonts;
in {
  fonts.packages = 
  [
    nerdFonts.jetbrains-mono
  ];
}

