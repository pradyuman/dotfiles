{ inputs, ... }:

{
  imports = [
    inputs.determinate.darwinModules.default
    inputs.home-manager.darwinModules.home-manager
    inputs.nix-homebrew.darwinModules.nix-homebrew
    inputs.nix-vmware-fusion.darwinModules.default
    ../../modules/darwin
  ];

  determinateNix.enable = true;

  networking.hostName = "astraea";

  users.users.pmn = {
    name = "pmn";
    home = "/Users/pmn";
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs; };

    users.pmn = {
      imports = [ ../../modules/home ];
      home.stateVersion = "26.05";
    };
  };

  nix-homebrew = {
    enable = true;
    user = "pmn";
    mutableTaps = false;
    taps = {
      "homebrew/homebrew-core" = inputs.homebrew-core;
      "homebrew/homebrew-cask" = inputs.homebrew-cask;
    };
  };

  programs.vmware-fusion.enable = true;

  system = {
    stateVersion = 5;
    primaryUser = "pmn";
  };
}
