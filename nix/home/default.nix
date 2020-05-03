{ config, pkgs, ... }:

let
  dotfiles = "${config.home.homeDirectory}/dotfiles";
in {
  home.file.".hyper.js".source = "${dotfiles}/.hyper.js";

  imports = [
    ./git.nix
    ./linux.nix
    ./mac.nix
    ./ssh.nix
    ./vscode.nix
    ./zsh.nix
  ];

  home.packages = with pkgs; [
    # Utils
    exa
    nmap
    parallel
    unzip
    wget

    # Dev Ops
    awscli
    docker-compose
    grpcui
    kubectl

    # Programming
    coursier
    openjdk8
    protobuf
    python
    sbt
    scala
    stack
    yarn

    (callPackage ./packages/n.nix {})

    # Databases
    postgresql_11
  ];

  programs = {
    bat.enable = true;
    gpg.enable = true;
    htop.enable = true;
    jq.enable = true;
    tmux.enable = true;
  };

  nixpkgs.config.allowUnfree = true;
}