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

    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    doomemacs = {
      url = "git+https://github.com/doomemacs/doomemacs?submodules=1";
      flake = false;
    };

    nix-orion = {
      url = "github:pradyuman/nix-orion";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-vmware-fusion = {
      url = "github:pradyuman/nix-vmware-fusion";
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
      treefmt-nix,
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
            value =
              let
                pkgs = nixpkgs.legacyPackages.${system};
                treefmt = treefmt-nix.lib.evalModule pkgs {
                  projectRootFile = "flake.nix";
                  programs = {
                    nixfmt.enable = true;
                    stylua.enable = true;
                  };
                };
              in
              treefmt.config.build.wrapper;
          }) systems
        );

    };
}
