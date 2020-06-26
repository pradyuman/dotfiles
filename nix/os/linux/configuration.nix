{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    wget
  ];

  services.xserver = {
    enable = true;
    displayManager.defaultSession = "xfce";
    desktopManager.xfce.enable = true;
  };
  
  services.blueman.enable = true;
  
  boot.extraModprobeConfig = ''
    options iwlwifi bt_coex_active=0
  '';

  hardware = {
    enableAllFirmware = true;
    cpu.amd.updateMicrocode = true;

    bluetooth = {
      enable = true;
      config = {
        General = {
          Enable = "Source,Sink,Media,Socket";
        };
      };
    };

    pulseaudio = {
      enable = true;
      package = pkgs.pulseaudioFull;
      extraModules = [ pkgs.pulseaudio-modules-bt ];
      extraConfig = ''
        load-module module-switch-on-connect
      '';
    };
  };

  networking.wireless.enable = true;
  sound.enable = true;
  time.timeZone = "America/Chicago";

  nixpkgs.config.allowUnfree = true;
}