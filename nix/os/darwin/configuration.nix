{ config, pkgs, ... }:

{
  imports = [
    ./yabai.nix
    ./skhd.nix
  ];

  environment.systemPackages = [ pkgs.vim ];
  programs.zsh.enable = true;

  system.keyboard = {
    enableKeyMapping = true;
    remapCapsLockToControl = true;
  };
}
