{ pkgs, lib, ... }:

let
  z = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/rupa/z/master/z.sh";
    sha256 = "mORDjNMa+zzllBMDNef72L5dddmlPk8+CE2X5rjRmw4=";
  };
in {
  home.packages = with pkgs; [
    zsh
  ];

  programs.zsh = lib.mkMerge [{
    enable = true;

    localVariables = {
      GPG_TTY = "$(tty)";
    };

    enableAutosuggestions = true;
    enableCompletion = true;

    plugins = [
      {
        name = "zsh-syntax-highlighting";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-syntax-highlighting";
          rev = "0.6.0";
          sha256 = "0zmq66dzasmr5pwribyh4kbkk23jxbpdw4rjxx0i7dx8jjp2lzl4";
        };
      }
      {
        name = "pure";
        src = pkgs.fetchFromGitHub {
          owner = "sindresorhus";
          repo = "pure";
          rev = "v1.12.0";
          sha256 = "1h04z7rxmca75sxdfjgmiyf1b5z2byfn6k4srls211l0wnva2r5y";
        };
      }
    ];

    initExtra = ''
      autoload -U promptinit; promptinit
      prompt pure
      source ${z}
    '';
  }

  (lib.mkIf pkgs.stdenv.isDarwin {
    localVariables = {
      NIX_PATH = "$HOME/.nix-defexpr/channels\${NIX_PATH:+:}$NIX_PATH";
    };

    initExtra = ''
      . $HOME/nova/secrets/dev.env
    '';
  })];
}
