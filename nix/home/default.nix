{ config, pkgs, ... }:

let
  dotfiles = "${config.home.homeDirectory}/dotfiles";
in {
  home.file.".hyper.js".source = "${dotfiles}/.hyper.js";

  imports = [
    ./git.nix
    ./ssh.nix
    ./vscode.nix
    ./zsh/default.nix
  ];

  home.packages = with pkgs; [
    docker-compose
    exa
    openjdk8
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

    (callPackage ./packages/grpcui.nix {})
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
