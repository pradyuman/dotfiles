{ pkgs, lib, config, ... }:

lib.mkMerge [{
  programs.vscode = {
    enable = true;

    userSettings = {
      "editor.tabSize" = 2;
      "editor.formatOnSave" = true;
      "editor.codeActionsOnSave" = {
        "source.organizeImports" = true;
	    };
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
        name = "vscode-apollo";
        publisher = "apollographql";
        version = "1.12.0";
        sha256 = "1xvf3zpmvgmbjx85v5wi9r8z0zq6gwb462f63jfjwa8rv45p2bdx";
      }
      {
        name = "nix";
        publisher = "bbenoist";
        version = "1.0.1";
        sha256 = "0zd0n9f5z1f0ckzfjr38xw2zzmcxg1gjrava7yahg5cvdcw6l35b";
      }
      {
        name = "prettier-vscode";
        publisher = "esbenp";
        version = "2.3.0";
        sha256 = "0jv1pzm8bpd7ajvl797gbvxllic1ir8lwc93lq54bdyaizj9sbvz";
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
        name = "terraform";
        publisher = "mauve";
        version = "1.4.0";
        sha256 = "0b3cqxaay85ab10x1cg7622rryf4di4d35zq9nqcjg584k6jjb34";
      }
      {
        name = "vscode-typescript-tslint-plugin";
        publisher = "ms-vscode";
        version = "1.2.2";
        sha256 = "1n2yv37ljaadp84iipv7czzs32dbs4q2vmb98l3z0aan5w2g8x3z";
      }
      {
        name = "scala";
        publisher = "scala-lang";
        version = "0.3.8";
        sha256 = "17dl10m3ayf57sqgil4mr9fjdm7i8gb5clrs227b768pp2d39ll9";
      }
      {
        name = "metals";
        publisher = "scalameta";
        version = "1.6.0";
        sha256 = "1ynwsn96dgjn6nwqln5r3vrkvpsv23aza06lss3asd6ynbfijaxl";
      }
      {
        name = "vim";
        publisher = "vscodevim";
        version = "1.11.3";
        sha256 = "1smzsgcrkhghbnpy51gp28kh74l7y4s2m8pfxabb4ffb751254j0";
      }
      {
        name = "vscode-import-cost";
        publisher = "wix";
        version = "2.12.0";
        sha256 = "1g6k8fxfa49ky8v3l5n6l7p6gnjf9sdd56crcj33p08gb8pyy86l";
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
