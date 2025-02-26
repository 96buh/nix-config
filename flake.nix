{
  description = "Homer nix-darwin and Linux configuration";

  inputs = {
    nixpkgs = { url = "github:NixOS/nixpkgs/nixpkgs-unstable"; };
    nix-darwin = { url = "github:LnL7/nix-darwin/master"; inputs.nixpkgs.follows = "nixpkgs"; };
    nix-homebrew = { url = "github:zhaofengli-wip/nix-homebrew"; };
    home-manager = { url = "github:nix-community/home-manager"; inputs.nixpkgs.follows = "nixpkgs"; };
    alacritty-theme = { url = "github:alexghr/alacritty-theme.nix"; };
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, nix-homebrew, home-manager, alacritty-theme, ... }:
  let
    # 定義配置函數，根據 targetSystem 生成配置
    mkConfig = targetSystem: let
      configuration = import ./configuration.nix {
        config = {};
        self = self;
        nixpkgs = nixpkgs;
        targetSystem = targetSystem;
      };
    in if (targetSystem == "aarch64-darwin" || targetSystem == "x86_64-darwin") then
      nix-darwin.lib.darwinSystem {
        system = targetSystem;
        modules = [
          configuration
          ./host/darwin
          ({ config, pkgs, ... }: {
            nixpkgs.overlays = [ alacritty-theme.overlays.default ];
          })
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.homer = { imports = [ ./home/home.nix ]; };
            home-manager.backupFileExtension = "backup";
          }
          nix-homebrew.darwinModules.nix-homebrew
          {
            nix-homebrew = {
              enable = true;
              enableRosetta = true;
              user = "homer";
              autoMigrate = true;
            };
          }
        ];
        specialArgs = { inherit inputs; };
      }
    else
      nixpkgs.lib.nixosSystem {
        system = targetSystem;
        modules = [
          configuration
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.homer = { imports = [ ./home/home.nix ]; };
            home-manager.backupFileExtension = "backup";
          }
        ];
        specialArgs = { inherit inputs; };
      };
  in
  {
    # macOS 配置
    darwinConfigurations.macbookpro = mkConfig "aarch64-darwin"; # 如果是 Intel Mac，改成 "x86_64-darwin"

    # Linux 配置
    nixosConfigurations.myLinux = mkConfig "x86_64-linux"; # 如果是 ARM Linux，改成 "aarch64-linux"
  };
}
