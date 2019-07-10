{ config, pkgs, ... }:

let
  dotfiles = "${config.home.homeDirectory}/dotfiles";
in {
  home.file.".hyper.js".source = "${dotfiles}/.hyper.js";

  imports = [
    ./git.nix
    ./ssh.nix
    ./vscode.nix
    ./zsh/config.nix
  ];

  home.packages = with pkgs; [
    exa
    jdk
    parallel
    pinentry_mac
    protobuf
    yarn
    python
    awscli
    unzip

    # Scala
    coursier
    sbt
    scala

    (callPackage ./packages/n.nix {})
    (callPackage ./packages/z.nix {})
  ];

  programs = {
    bat.enable = true;
    gpg.enable = true;
    home-manager.enable = true;
    htop.enable = true;
    jq.enable = true;
    tmux.enable = true;
    vim.enable = true;
  };

  nixpkgs.config.allowUnfree = true;
}
