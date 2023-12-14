{ pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    zsh
  ];

  programs.zsh = {
    enable = true;

    localVariables = {
      GPG_TTY = "$(tty)";
    };

    enableAutosuggestions = true;
    enableCompletion = true;

    initExtra = ''
      eval "$(zoxide init zsh)"
    '';
  };
}
