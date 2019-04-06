{ config, pkgs, ... }:

let
  dotfiles = "${config.home.homeDirectory}/codex/dotfiles";
in {
  home.file.".gitconfig".source = "${dotfiles}/.gitconfig";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  services = {
    gpg-agent = {
      enable = true;
      defaultCacheTtl = 7 * 24 * 3600;
      maxCacheTtl = 7 * 24 * 3600;
      enableSshSupport = true;
    };
  };
}
