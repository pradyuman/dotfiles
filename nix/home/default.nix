{ config, pkgs, ... }:

let
  dotfiles = "${config.home.homeDirectory}/dotfiles";
in {
  imports = [
    ./git.nix
    ./gpg.nix
    ./ssh.nix
    ./vim.nix
    ./vscode.nix
    ./zsh.nix

    ./os-specific/linux.nix
    ./os-specific/darwin.nix 
  ];

  home.sessionVariables = {
    EDITOR = "vim";
  };

  home.file.".hyper.js".source = "${dotfiles}/.hyper.js";

  home.packages = with pkgs; [
    # Utils
    exa
    fzf
    jq
    nmap
    parallel
    unzip
    wget
    yq

    # Dev Ops
    awscli
    docker-compose
    grpcui
    jx
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