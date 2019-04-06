{ config, pkgs, ... }:

{
  environment = {
    systemPackages = with pkgs; [
      bat
      exa
      git
      gnupg
      networkmanagerapplet
      vim
      wget
      xclip
      zsh
    ];
  };

  time.timeZone = "America/Los_Angeles";
} 

