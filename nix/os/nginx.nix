{ config, lib, pkgs, ... }:

# To get this to work, you need a DNS A Record to the Local IP

let
  hostname = lib.toLower config.networking.hostName;
in {
  networking = {
    firewall.allowedTCPPorts = [
      80
    ]; 
  };

  services.nginx = {
    enable = true;

    virtualHosts."${hostname}.pradyuman.co" = {
      root = "/home/pradyuman/www";
    };

    virtualHosts."api.aba.${hostname}.pradyuman.co" = {
      locations."/" = {
        proxyPass = "http://${hostname}.pradyuman.co:9663/";
      };
    };

    virtualHosts."app.aba.${hostname}.pradyuman.co" = {
      locations."/" = {
        proxyPass = "http://${hostname}.pradyuman.co:3000/";
      };
    };
  };
}