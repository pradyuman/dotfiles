{ pkgs, ... }:

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

  ids.gids.nixbld = 30000;

  home-manager.users.pmn = {
    imports = [ ../../home ];
    home.stateVersion = "23.05";
  };

  system = {
    stateVersion = 5;
    primaryUser = "pmn";
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
