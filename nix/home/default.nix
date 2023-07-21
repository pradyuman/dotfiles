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

  home.packages = with pkgs; [
    # Utils
    nmap
    unzip
    wget

    # Node
    nodejs_20
    nodePackages.pnpm

    # Scala
    coursier
    sbt
    scala

  ];

  programs = {
    bat.enable = true;
    exa.enable = true;
    fzf.enable = true;
    htop.enable = true;
    jq.enable = true;
    tmux.enable = true;
  };

  nixpkgs.config.allowUnfree = true;
}
