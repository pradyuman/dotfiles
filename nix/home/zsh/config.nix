{ pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    zsh
    (callPackage ./pure-prompt.nix {})
  ];

  programs.zsh = lib.mkMerge [{
    enable = true;

    localVariables = {
        GPG_TTY = "$(tty)";
    };

    initExtra = ''
      autoload -U promptinit; promptinit
      prompt pure
    '';
  }

  (lib.mkIf pkgs.stdenv.isDarwin {
    localVariables = {
      NIX_PATH = "$HOME/.nix-defexpr/channels\${NIX_PATH:+:}$NIX_PATH";
    };

    initExtra = ''
      . $HOME/.nix-profile/etc/profile.d/nix.sh
    '';
  })];
}