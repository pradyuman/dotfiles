{ pkgs, inputs, ... }:

{
  imports = [
    ./homebrew.nix
    ./skhd.nix
    ./yabai.nix
  ];

  nixpkgs = {
    config.allowUnfree = true;
    overlays = [
      inputs.emacs-overlay.overlay
      (import ../../overlays/darwin/emacs.nix)
    ];
  };

  environment.systemPackages = with pkgs; [
    vim
    nixfmt
  ];

  programs.zsh.enable = true;

  system.defaults = {
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
}
