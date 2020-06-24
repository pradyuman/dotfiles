{ config, pkgs, ... }:

{
  imports = [
    ./yabai.nix
    ./skhd.nix
  ];

  environment.systemPackages = [ pkgs.vim ];
  programs.zsh.enable = true;

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

    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToControl = true;
    };
  };
}
