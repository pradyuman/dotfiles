{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    wget
  ];

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

  networking.wireless.enable = true; # Enables wireless support via wpa_supplicant.

  time.timeZone = "America/Chicago";
}