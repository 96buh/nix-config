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
      # Apps in the dock
      persistent-apps = [
        "/Applications/Alacritty.app"
        "/Applications/Obsidian.app"
        "/Applications/Zen Browser.app"
        "/Applications/Visual Studio Code.app"
      ];
      show-recents = false;
      orientation = "bottom";
      # Hot corner action
      wvous-bl-corner = 4; # botoom left: Desktop
    };
    finder = {
      AppleShowAllExtensions = true;
      FXPreferredViewStyle = "clmv";
      ShowPathbar = true;
      ShowStatusBar = true;
    };
    trackpad = {
      TrackpadThreeFingerDrag = true; # three finger drag
    };
    NSGlobalDomain = {
        AppleInterfaceStyle = "Dark";
        "com.apple.mouse.tapBehavior" = 1; # enable tap to click
    };

    controlcenter.BatteryShowPercentage = true; # show battery percentage
    WindowManager.HideDesktop = true;
    WindowManager.StandardHideDesktopIcons = true;
  };

  # Enable sudo authentication with Touch ID
  security.pam.enableSudoTouchIdAuth = true;

  # app settings
  system.defaults.CustomUserPreferences = {
    "com.microsoft.VSCode" = {
      ApplePressAndHoldEnabled = false; 
    };
  };
}

