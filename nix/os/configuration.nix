{ config, pkgs, ... }:

{
  environment = {
    systemPackages = with pkgs; [
      git
      gnupg
      networkmanagerapplet
      vim
      wget
      xclip
      zsh
    ];
  };
} 

