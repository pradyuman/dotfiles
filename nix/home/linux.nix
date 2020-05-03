{ config, pkgs, lib, ... }:

(lib.mkIf pkgs.stdenv.isLinux {
  home.packages = with pkgs; [
    netdata
    xclip
  ];
})