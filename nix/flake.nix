{
  description = "Pradyuman's Nix Config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    emacs-overlay = {
      url = "github:nix-community/emacs-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    doomemacs = {
      url = "github:doomemacs/doomemacs";
      flake = false;
    };
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      nix-darwin,
      home-manager,
      ...
    }:
    {
      darwinConfigurations.astraea = nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        pkgs = import nixpkgs { system = "aarch64-darwin"; };
        modules = [
          ./os/darwin/configuration.nix
          home-manager.darwinModules.home-manager
          { home-manager.extraSpecialArgs = { inherit inputs; }; }
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
            value = nixpkgs.legacyPackages.${system}.nixfmt-rfc-style;
          }) systems
        );

    };
}
