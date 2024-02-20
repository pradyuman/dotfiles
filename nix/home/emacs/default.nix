{ config, lib, pkgs, inputs, ...  }:

let
  emacsPkg = with pkgs; ((emacsPackagesFor emacsDarwin).emacsWithPackages (epkgs: [
    epkgs.vterm
  ]));
in {
  nixpkgs.overlays = [
    inputs.emacs-overlay.overlay
    (import ../../overlays/emacs-darwin.nix)
  ];

  home = {
    packages = with pkgs; [
      # Emacs
      emacsPkg

      # For Doom
      fontconfig
      git
      (ripgrep.override { withPCRE2 = true; })
      fd # faster projectile indexing

      # For Doom modules
      coreutils-prefixed # :emacs dired
      gnugrep # :completion vertico
      nixfmt # :lang nix
      pandoc # :lang markdown
      shellcheck # :lang sh
    ];

    shellAliases = {
      e = "emacsclient -n";
    };

    activation.installDoomEmacs = lib.hm.dag.entryAfter ["writeBoundary"] ''
      ${pkgs.rsync}/bin/rsync -avz --chmod=D2755,F744 ${inputs.doomemacs}/ ${config.xdg.configHome}/emacs/
    '';
  };

  programs.zsh.envExtra = ''
    export PATH="${config.xdg.configHome}/emacs/bin:$PATH"
  '';

  xdg.configFile."doom" = {
    source = ./doom;
    force = true;
  };

  launchd.enable = true;
  launchd.agents.emacs = {
    enable = true;
    config = {
      ProgramArguments = [
        "${pkgs.bash}/bin/bash"
        "-l"
        "-c"
        "${emacsPkg}/bin/emacs --fg-daemon"
      ];
      StandardErrorPath = "${config.home.homeDirectory}/Library/Logs/emacs-daemon.stderr.log";
      StandardOutPath = "${config.home.homeDirectory}/Library/Logs/emacs-daemon.stdout.log";
      RunAtLoad = true;
      KeepAlive = true;
    };
  };

}