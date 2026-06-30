{ pkgs, inputs, ... }:

{
  imports = [
    ./yabai.nix
    ./skhd.nix
    ./homebrew.nix
  ];

  nixpkgs = {
    config.allowUnfree = true;
    overlays = [
      inputs.emacs-overlay.overlay
      (import ../../overlays/emacs-darwin.nix)
    ];
  };

  environment.systemPackages = with pkgs; [
    vim
    nixfmt
  ];

  programs.zsh.enable = true;

  users.users.pmn = {
    name = "pmn";
    home = "/Users/pmn";
  };

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
