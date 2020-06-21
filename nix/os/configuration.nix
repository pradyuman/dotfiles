{ config, pkgs, ... }:

{
  environment = {
    systemPackages = with pkgs; [
      curl
      vim
      wget
    ];
  };

  services.xserver = {
    enable = true;

    displayManager = {
      defaultSession = "xfce";
    };

    desktopManager = {
      xterm.enable = false;
      xfce.enable = true;
    };
  };

  time.timeZone = "America/Chicago";
}