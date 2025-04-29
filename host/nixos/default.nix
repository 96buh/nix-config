{ config, pkgs, ... }:
{
  imports = [
    ../../modules/shared/fonts.nix
    ./hardware-configuration.nix
  ];

  environment.systemPackages = import ../../modules/shared/packages.nix { pkgs = pkgs; };

  # bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "homer";
  time.timeZone = "Asia/Taipei";
  i18n.defaultLocale = "en_US.UTF-8";
  networking.networkmanager.enable = true;

  users.users.homer = {
    isNormalUser = true;
    description = "Homer";
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.zsh;
    packages = with pkgs; [
      kdePackages.kate
    ];
  };
  
  services.printing.enable = true;
  hardware.bluetooth.enable = true;
  hardware.pulseaudio.enable = false;
  security.rkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };


  # Allow unfree apps
  nixpkgs.config.allowUnfree = true;

  # 使用 zsh 當作預設 shell
  programs.zsh.enable = true;

  # 啟用 sudo
  security.sudo.enable = true;
  security.sudo.wheelNeedsPassword = false;

  # 啟用openssh
  services.openssh.enable = true;

  # Nix 設定
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;


  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  system.stateVersion = "24.11"; 
}

