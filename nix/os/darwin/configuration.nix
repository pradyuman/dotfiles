{ config, pkgs, ... }:

{
  imports = [
    ./yabai.nix
    ./skhd.nix
    <home-manager/nix-darwin>
  ];

  environment.systemPackages = [ pkgs.vim ];
  programs.zsh.enable = true;

  users.users.pmn = {
    name = "pmn";
    home = "/Users/pmn";
  };

  home-manager.users.pmn = { pkgs, ... }: {
    imports = [ ../../home/default.nix ];
    home.stateVersion = "23.05";
  };

  system = {
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
