{ config, pkgs, ... }:

let
  dotfiles = "${config.home.homeDirectory}/codex/dotfiles";
in {
  home.file.".gitconfig".source = "${dotfiles}/.gitconfig";

  imports = [
    ./zsh.nix
  ];

  home.packages = with pkgs; [
    git
    gnupg
    jq
    parallel
    pinentry_mac
    protobuf
    yarn
    python
    awscli
    unzip
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  nixpkgs.config.allowUnfree = true;
}
