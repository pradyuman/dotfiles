{ config, pkgs, lib, ... }:

let
  dotfiles = "${config.home.homeDirectory}/dotfiles";
in (lib.mkIf pkgs.stdenv.isDarwin {
  home.file.".yabairc".source = "${dotfiles}/.yabairc";
  home.file.".skhdrc".source = "${dotfiles}/.skhdrc";
  home.file.".config/karabiner/karabiner.json".source = "${dotfiles}/karabiner.json";

  home.packages = with pkgs; [
    pinentry_mac
  ];
})