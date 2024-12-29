{
  config,
  lib,
  pkgs,
  ...
}:

# To get this to work, you need a DNS A Record to the Local IP

let
  hostname = lib.toLower config.networking.hostName;
in
{
  networking = {
    networkmanager = {
      enable = true;
      wifi.powersave = false;
    };

    firewall.allowedTCPPorts = [
      80
    ];
  };

  services.nginx = {
    enable = true;

    virtualHosts."${hostname}.pradyuman.co" = {
      root = "/home/pradyuman/www";
    };
  };
}
