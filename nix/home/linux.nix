{ config, pkgs, lib, ... }:

(lib.mkIf pkgs.stdenv.isLinux {
  home.packages = with pkgs; [
    # General
    keybase-gui

    # Utils
    lm_sensors
    pciutils
    pinentry-gtk2
    psensor
    xclip

    # Build
    binutils
    cmake
    pkg-config
    gcc
    gnumake
  ];

  programs.chromium.enable = true;

  services = {
    gpg-agent.enable = true;
    kbfs.enable = true;
    keybase.enable = true;
  };
})
