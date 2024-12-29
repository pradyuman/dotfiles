{
  config,
  pkgs,
  home-manager,
  ...
}:

{
  imports = [
    ./yabai.nix
    ./skhd.nix
    ./homebrew.nix
  ];

  environment.systemPackages = with pkgs; [
    vim
    nixfmt-rfc-style
  ];
  programs.zsh.enable = true;

  users.users.pmn = {
    name = "pmn";
    home = "/Users/pmn";
  };

  home-manager.users.pmn =
    { pkgs, ... }:
    {
      imports = [ ../../home ];
      home.stateVersion = "23.05";
    };

  services.nix-daemon.enable = true;

  system = {
    stateVersion = 5;
    defaults = {
      finder._FXShowPosixPathInTitle = true;
      loginwindow.GuestEnabled = false;

      NSGlobalDomain = {
        "com.apple.swipescrolldirection" = false;
        _HIHideMenuBar = true;
      };

      dock = {
        autohide = true;
        launchanim = false;
        mru-spaces = false;
      };
    };
  };
}
