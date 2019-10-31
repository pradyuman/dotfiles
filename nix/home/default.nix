{ config, pkgs, ... }:

let
  dotfiles = "${config.home.homeDirectory}/dotfiles";
in {
  home.file.".hyper.js".source = "${dotfiles}/.hyper.js";
  home.file.".yabairc".source = "${dotfiles}/.yabairc";
  home.file.".skhdrc".source = "${dotfiles}/.skhdrc";
  home.file.".config/karabiner/karabiner.json".source = "${dotfiles}/karabiner.json";

  imports = [
    ./git.nix
    ./ssh.nix
    ./vscode.nix
    ./zsh/default.nix
  ];

  home.packages = with pkgs; [
    # Utils
    exa
    nmap
    parallel
    pinentry_mac
    unzip
    wget

    (callPackage ./packages/z.nix {})

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
    yarn

    (callPackage ./packages/n.nix {})

    # Databases
    postgresql_11
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
