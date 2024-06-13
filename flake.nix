{
  description = "A simple NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    pollymc.url = "github:fn2006/PollyMC/develop";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
   {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        ./configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
	  home-manager.useUserPackages = true;

          home-manager.users.rev = import ./config;
        }
      ];
    };
  };
}
