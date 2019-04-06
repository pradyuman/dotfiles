{ config, pkgs, ... }:

let
  dotfiles = "${config.home.homeDirectory}/codex/dotfiles";
in {
  home.file.".gitconfig".source = "${dotfiles}/.gitconfig";

  home.packages = with pkgs; [
    brave
    discord
    slack
    signal-desktop
    vscode

    dhall
    dhall-json

    jq
    parallel
    protobuf
    yarn
    nodejs-10_x
    python
  ];

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

  nixpkgs.config = {
    packageOverrides = pkgs: {
      yarn = pkgs.yarn.override { nodejs = pkgs.nodejs-10_x; };
    };
  };

  nixpkgs.config.allowUnfree = true;
}
