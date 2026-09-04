{
  description = "A very basic flake";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs?ref=nixos-unstable";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    helium-flake = {
      url = "github:oxcl/nix-flake-helium-browser";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    devenv = {
      url = "github:cachix/devenv";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix = {
      url = "github:mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, helium-flake, devenv, sops-nix, ... } @ inputs:
    let
      inherit (self) outputs;
      lib = nixpkgs.lib;
      system = "x86_64-linux";
    in
    {
      nixosConfigurations = {
        nixos = lib.nixosSystem {
          inherit system;
          modules = [ ./hosts/nixos ];
          specialArgs = {
            inherit inputs outputs;
          };
        };
      };

      homeConfigurations = {
        augustin = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
          modules = [
            ./home/augustin/home.nix
          ];
          extraSpecialArgs = {
            sops-nix = sops-nix;
            helium = helium-flake;
            devenv = devenv;
          };
        };
      };
    };
}
