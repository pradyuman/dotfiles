{ pkgs, lib, config, ... }:

lib.mkMerge [{
  programs.vscode = {
    enable = true;

    userSettings = {
      "editor.tabSize" = 2;
      "editor.formatOnSave" = true;
      "vim.useSystemClipboard" = true;
      "[javascript]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };
      "[typescript]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };
      "[scala]" = {
        "editor.defaultFormatter" = "scalameta.metals";
      };
      "update.mode" = "none";
      "metals.javaHome" = pkgs.openjdk8;
    };

    extensions = pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "nix";
        publisher = "bbenoist";
        version = "1.0.1";
        sha256 = "0zd0n9f5z1f0ckzfjr38xw2zzmcxg1gjrava7yahg5cvdcw6l35b";
      }
      {
        name = "prettier-vscode";
        publisher = "esbenp";
        version = "1.9.0";
        sha256 = "1an9dlkicj1s0ffy9l9jdvzpcdl0slvln9k05rd6l8g42ri9fp49";
      }
      {
        name = "vscode-styled-components";
        publisher = "jpoissonnier";
        version = "0.0.26";
        sha256 = "09lgc1fjdrgzw6n72w833kyfk7m0008lmd17r0vljcd572igfhhc";
      }
      {
        name = "language-haskell";
        publisher = "justusadam";
        version = "2.6.0";
        sha256 = "1891pg4x5qkh151pylvn93c4plqw6vgasa4g40jbma5xzq8pygr4";
      }
      {
        name = "graphql-for-vscode";
        publisher = "kumar-harsh";
        version = "1.13.2";
        sha256 = "0bv03p2r6d2z72czplx0q8kmhjjs0i3cmwjf3jrgv324i537xh3z";
      }
      {
        name = "vscode-typescript-tslint-plugin";
        publisher = "ms-vscode";
        version = "1.2.1";
        sha256 = "081p212yg1ihgddlvfp7nzzjl7j6mndhva8bwk40jxxzyfmll7rc";
      }
      {
        name = "scala";
        publisher = "scala-lang";
        version = "0.3.4";
        sha256 = "1p2ldayaxyz9q7azlwi9b25a37d6w03q4yrzdpmixklxj5d67pch";
      }
      {
        name = "metals";
        publisher = "scalameta";
        version = "1.5.1";
        sha256 = "0fhynr97haldvk31cf777pcxbvbcqfxzd9jspwczd1xnhh9z0ic6";
      }
      {
        name = "vim";
        publisher = "vscodevim";
        version = "1.8.1";
        sha256 = "0gra5sh4ln20fsbmg9hawxsv5c2yd7cw5frhcc2m3p793hgr3lq0";
      }
      {
        name = "vscode-proto3";
        publisher = "zxh404";
        version = "0.3.0";
        sha256 = "1iylw9hihqz0pab4iisykgrq20141v5f1r6l4cif1z4237nd3z60";
      }
    ];
  };
}

(lib.mkIf pkgs.stdenv.isDarwin {
  programs.vscode.userSettings = {
    "terminal.integrated.shell.osx" = with builtins; "${getEnv "HOME"}/.nix-profile/bin/zsh";
  };
})]
