{
  pkgs,
  lib,
  ...
}:

(lib.mkIf pkgs.stdenv.isDarwin {
  home.file.".gnupg/gpg-agent.conf" = {
    text = "pinentry-program ${pkgs.pinentry_mac}/${pkgs.pinentry_mac.passthru.binaryPath}";
  };

  home.packages = with pkgs; [
    pinentry_mac
  ];
})
