{ pkgs, inputs, ... }:

{
  imports = [
    ./aside.nix
    ./fonts.nix
    ./homebrew.nix
    ./skhd.nix
    ./yabai.nix
  ];

  nixpkgs = {
    config.allowUnfree = true;
    overlays = [
      inputs.nix-orion.overlays.default
    ];
  };

  environment.systemPackages = with pkgs; [
    vim
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
