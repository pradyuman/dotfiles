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

  users.users.pradyuman = {
    uid = 1989;
    description = "Pradyuman Vig";
    isNormalUser = true;
    home = "/home/pradyuman";
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
  };

  time.timeZone = "America/Chicago";
}