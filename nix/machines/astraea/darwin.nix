{
  imports = [
    ../../modules/darwin
  ];

  networking.hostName = "astraea";

  users.users.pmn = {
    name = "pmn";
    home = "/Users/pmn";
  };

  home-manager.users.pmn = {
    imports = [ ../../modules/home ];
    home.stateVersion = "26.05";
  };

  system = {
    stateVersion = 5;
    primaryUser = "pmn";
  };
}
