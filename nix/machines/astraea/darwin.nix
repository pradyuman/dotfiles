{ inputs, ... }:

{
  imports = [
    inputs.determinate.darwinModules.default
    inputs.home-manager.darwinModules.home-manager
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

  system = {
    stateVersion = 5;
    primaryUser = "pmn";
  };
}
