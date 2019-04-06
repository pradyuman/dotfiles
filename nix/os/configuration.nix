{ config, pkgs, ... }:

{
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
      gcc
      gnumake
    ];
  };

  time.timeZone = "America/Los_Angeles";
} 

