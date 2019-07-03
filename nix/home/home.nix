{ config, pkgs, ... }:

{
  imports = [
    ./git.nix
    ./vscode.nix
    ./zsh/config.nix
  ];

  home.packages = with pkgs; [
    bat
    exa
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
