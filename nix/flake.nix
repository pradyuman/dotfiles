{
  description = "Pradyuman's Nix Config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    determinate.url = "github:DeterminateSystems/determinate";

    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-homebrew.url = "github:zhaofengli/nix-homebrew";

    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };

    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };

    emacs-overlay = {
      url = "github:nix-community/emacs-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    doomemacs = {
      url = "github:doomemacs/doomemacs";
      flake = false;
    };

    nix-orion = {
      url = "github:pradyuman/nix-orion";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      determinate,
      nix-darwin,
      home-manager,
      ...
    }:
    {
      homeModules.default = ./modules/home;
      darwinModules.default = ./modules/darwin;

      darwinConfigurations.astraea = nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        specialArgs = { inherit inputs; };
        modules = [
          ./machines/astraea/darwin.nix
        ];
      };

      formatter =
        let
          systems = [
            "aarch64-darwin"
            "x86_64-linux"
          ];
        in
        builtins.listToAttrs (
          map (system: {
            name = system;
            value = nixpkgs.legacyPackages.${system}.nixfmt-tree;
          }) systems
        );

    };
}
