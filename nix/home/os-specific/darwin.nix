{
  config,
  pkgs,
  lib,
  ...
}:

let
  dotfiles = "${config.home.homeDirectory}/dotfiles";
in
(lib.mkIf pkgs.stdenv.isDarwin {
  home.file.".gnupg/gpg-agent.conf" = {
    text = "pinentry-program ${pkgs.pinentry_mac}/${pkgs.pinentry_mac.passthru.binaryPath}";
  };

  home.packages = with pkgs; [
    pinentry_mac
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
})
