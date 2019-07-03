{ config, pkgs, ... }:

let
  dotfiles = "${config.home.homeDirectory}/dotfiles";
in {
  home.file.".gitconfig".source = "${dotfiles}/.gitconfig";

  imports = [
    ./zsh/config.nix
  ];

  home.packages = with pkgs; [
    bat
    exa
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

    (callPackage ./z.nix {})
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  nixpkgs.config.allowUnfree = true;
}
