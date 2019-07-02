{ pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    zsh
  ];

  programs.zsh = lib.mkMerge [{
    enable = true;

    localVariables = {
        GPG_TTY = "$(tty)";
    };

    oh-my-zsh = {
      enable = true;
      theme = "avit";
    };
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