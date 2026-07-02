{ pkgs, lib, ... }:

lib.mkMerge [
  {
    programs.gpg = {
      enable = true;
      settings = {
        default-key = "4378CA1B422BBB4C";
      };
    };
  }

  (lib.mkIf pkgs.stdenv.isDarwin {
    services.gpg-agent = {
      enable = true;
      pinentry.package = pkgs.pinentry_mac;
    };

    home.packages = with pkgs; [
      pinentry_mac
    ];
  })
]
