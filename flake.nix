{
  description = "Homer nix-darwin configuration";

  inputs = {
    nixpkgs = { 
      url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    };
    nix-darwin = {
      url = "github:LnL7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-homebrew = {
      url = "github:zhaofengli-wip/nix-homebrew";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, nix-homebrew, home-manager, ... }:

  let
      targetSystem = "aarch64-darwin";

      configuration = import ./configuration.nix {
        config = {};
        self = self;
        nixpkgs = nixpkgs;
        targetSystem = targetSystem;
      };
  in
  {

    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#macbookpro
    darwinConfigurations."macbookpro" = nix-darwin.lib.darwinSystem {
      modules = [
	configuration
	./host/darwin
	home-manager.darwinModules.home-manager
        {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.homer = import ./home/home.nix;
	    home-manager.backupFileExtension = "backup";

            # Optionally, use home-manager.extraSpecialArgs to pass
            # arguments to home.nix
        }
      	nix-homebrew.darwinModules.nix-homebrew
	{
	  nix-homebrew = {
	    enable = true;
	    # Apple Scilicon Only
	    enableRosetta = true;
	    user = "homer";

	    autoMigrate = true;
	  };
	}
      ];
      specialArgs = { inherit inputs; };
    };

  };
}
