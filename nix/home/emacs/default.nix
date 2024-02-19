{ config, lib, pkgs, inputs, ...  }:

{
  nixpkgs.overlays = [ inputs.emacs-overlay.overlay ];

  home.packages = with pkgs; [
    # Emacs
    ((emacsPackagesFor emacs29).emacsWithPackages
        (epkgs: [ epkgs.vterm ]))

    # For Doom
    fontconfig
    git
    (ripgrep.override { withPCRE2 = true; })
    fd # faster projectile indexing

    # For Doom modules
    coreutils-prefixed # :emacs dired
    gnugrep # :completion vertico
    pandoc # :lang markdown
    shellcheck # :lang sh
  ];

  programs.zsh.envExtra = ''
    export PATH="${config.xdg.configHome}/emacs/bin:$PATH"
  '';

  xdg.configFile."doom" = {
    source = ./doom;
    force = true;
  };

  home.activation.installDoomEmacs = lib.hm.dag.entryAfter ["writeBoundary"] ''
    ${pkgs.rsync}/bin/rsync -avz --chmod=D2755,F744 ${inputs.doomemacs}/ ${config.xdg.configHome}/emacs/
  '';

}