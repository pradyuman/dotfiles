{ config, pkgs, lib, ... }:

(lib.mkIf pkgs.stdenv.isLinux {
  home.packages = with pkgs; [
    lm_sensors
    psensor
    xclip
  ];
})