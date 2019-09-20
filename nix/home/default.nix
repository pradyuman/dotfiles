{ config, pkgs, ... }:

let
  dotfiles = "${config.home.homeDirectory}/dotfiles";
in {
  home.file.".hyper.js".source = "${dotfiles}/.hyper.js";
  home.file.".yabairc".source = "${dotfiles}/.yabairc";
  home.file.".skhdrc".source = "${dotfiles}/.skhdrc";

  imports = [
    ./git.nix
    ./ssh.nix
    ./vscode.nix
    ./zsh/default.nix
  ];

  home.packages = with pkgs; [
    docker-compose
    exa
    grpcui
    kubectl
    openjdk8
    parallel
    pinentry_mac
    postgresql_11
    protobuf
    yarn
    python
    awscli
    unzip
    wget

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
  };

  nixpkgs.config.allowUnfree = true;
}
