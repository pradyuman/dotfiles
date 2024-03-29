{ config, pkgs, home-manager, ... }:

{
  imports = [
    ./yabai.nix
    ./skhd.nix
    ./homebrew.nix
  ];

  environment.systemPackages = [ pkgs.vim ];
  programs.zsh.enable = true;

  users.users.pmn = {
    name = "pmn";
    home = "/Users/pmn";
  };

  home-manager.users.pmn = { pkgs, ... }: {
    imports = [ ../../home ];
    home.stateVersion = "23.05";
  };

  services.nix-daemon.enable = true;

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
