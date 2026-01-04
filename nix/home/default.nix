{ pkgs, ... }:

{
  imports = [
    ./emacs
    ./git.nix
    ./ghostty.nix
    ./gpg.nix
    ./ssh.nix
    ./starship.nix
    ./vim.nix
    ./vscode.nix
    ./zellij.nix
    ./zsh.nix

    ./os-specific/linux.nix
    ./os-specific/darwin.nix
  ];

  home.sessionVariables = {
    EDITOR = "vim";
  };

  home.packages = with pkgs; [
    # Utils
    just
    nmap
    unzip
    wget
    zoxide

    # Node
    nodejs_20
    pnpm

    # Typescript
    typescript
    biome

    # LLM
    claude-code
    codex
    ollama
    opencode
  ];

  programs = {
    bat.enable = true;
    eza.enable = true;
    fzf.enable = true;
    htop.enable = true;
    jq.enable = true;
    tmux.enable = true;
  };

  nixpkgs.config.allowUnfree = true;
}
