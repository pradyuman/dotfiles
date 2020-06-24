{ config, pkgs, ... }:

let
  dotfiles = "${config.home.homeDirectory}/dotfiles";
in {
  imports = [
    ./git.nix
    ./gpg.nix
    ./linux.nix
    ./mac.nix
    ./ssh.nix
    ./vim.nix
    ./vscode.nix
    ./zsh.nix
  ];

  home.sessionVariables = {
    EDITOR = "vim";
  };

  home.file.".hyper.js".source = "${dotfiles}/.hyper.js";

  home.packages = with pkgs; [
    # Utils
    exa
    fzf
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
    nodejs-12_x

    # Databases
    postgresql_11
  ];

  programs = {
    bat.enable = true;
    htop.enable = true;
    jq.enable = true;
    tmux.enable = true;
  };

  nixpkgs.config.allowUnfree = true;
}