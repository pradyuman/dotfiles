{ config, pkgs, ... }:

{
  imports =
    [ ./nginx.nix
    ];
    
  environment = {
    systemPackages = with pkgs; [
      bat
      curl
      exa
      git
      gnupg
      networkmanagerapplet
      vim
      wget
      xclip
      xscreensaver
      zip
      zsh

      # Build
      binutils
      clang
      cmake
      pkg-config
      gcc
      gnumake
    ];
  };

  time.timeZone = "America/Los_Angeles";
} 

