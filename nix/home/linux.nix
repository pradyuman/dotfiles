{ config, pkgs, lib, ... }:

(lib.mkIf pkgs.stdenv.isLinux {
  home.packages = with pkgs; [
    # General
    chromium
    keybase-gui
    lm_sensors
    psensor
    xclip

    # Build
    binutils
    cmake
    pkg-config
    gcc
    gnumake
  ];

  services = {
    kbfs.enable = true;
    keybase.enable = true;
  };
})
