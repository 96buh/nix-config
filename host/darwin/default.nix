{ config, pkgs, ... }:
{

  imports = [
    ../../modules/shared/fonts.nix
    ../../modules/darwin/homebrew.nix
  ];

  environment.systemPackages = import ../../modules/shared/packages.nix { pkgs = pkgs; };

  system.defaults = {
    dock = {
      autohide = true;
      autohide-delay = 0.0;
      autohide-time-modifier = 0.2;
      persistent-apps = [
        "/Applications/Alacritty.app"
        "/Applications/Obsidian.app"
        "/Applications/Zen Browser.app"
        "/Applications/Visual Studio Code.app"
      ];
      show-recents = false;
      orientation = "bottom";
    };
    finder = {
      FXPreferredViewStyle = "clmv";
      ShowPathbar = true;
      ShowStatusBar = true;
    };
    NSGlobalDomain.AppleInterfaceStyle = "Dark";
    NSGlobalDomain."com.apple.mouse.tapBehavior" = 1;
    trackpad.TrackpadThreeFingerDrag = true;
    controlcenter.BatteryShowPercentage = true;
    WindowManager.HideDesktop = true;
    WindowManager.StandardHideDesktopIcons = true;
  };

  system.defaults.CustomUserPreferences = {
    "com.microsoft.VSCode" = {
      ApplePressAndHoldEnabled = false;
    };
  };
}

