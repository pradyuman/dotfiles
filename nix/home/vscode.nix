{ pkgs, lib, config, ... }:

lib.mkMerge [{
  programs.vscode = {
    enable = true;

    userSettings = {
      "editor.tabSize" = 2;
      "editor.formatOnSave" = true;
      "editor.codeActionsOnSave" = [
        "source.organizeImports"
        "source.fixAll.eslint"
      ];
      "eslint.validate" = [
        "javascript"
        "javascriptreact"
        {
          "language" = "typescript";
          "autoFix" = true;
        }
        {
          "language" = "typescriptreact";
          "autoFix" = true;
        }
      ];
      "vim.useSystemClipboard" = true;
      "[javascript]" = {
        "editor.formatOnSave" = false;
      };
      "[javascriptreact]" = {
        "editor.formatOnSave" = false;
      };
      "[typescript]" = {
        "editor.formatOnSave" = false;
      };
      "[typescriptreact]" = {
        "editor.formatOnSave" = false;
      };
      "[scala]" = {
        "editor.defaultFormatter" = "scalameta.metals";
      };
      "update.mode" = "none";
      "metals.javaHome" = pkgs.openjdk8;
      "yaml" = {
        "completion" = true;
        "format.enable" = true;
        "schemaStore.enable" = true;
        "validate" = true;
      };
    };

    extensions = pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "vscode-apollo";
        publisher = "apollographql";
        version = "1.15.4";
        sha256 = "1l1blw5sdp7rb0xcbh5cs6kigwvnzfzd6ri2mah9m01sys4yl0nw";
      }
      {
        name = "nix";
        publisher = "bbenoist";
        version = "1.0.1";
        sha256 = "0zd0n9f5z1f0ckzfjr38xw2zzmcxg1gjrava7yahg5cvdcw6l35b";
      }
      {
        name = "gitlens";
        publisher = "eamodio";
        version = "10.2.1";
        sha256 = "1bh6ws20yi757b4im5aa6zcjmsgdqxvr1rg86kfa638cd5ad1f97";
      }
      {
        name = "vscode-eslint";
        publisher = "dbaeumer";
        version = "2.1.5";
        sha256 = "1fr8n736pfjnxz7kgi6m86d2w6z1bwxa23xpfcd8sik9nnrnsz59";
      }
      {
        name = "vscode-styled-components";
        publisher = "jpoissonnier";
        version = "0.0.29";
        sha256 = "1cvhvlx501clvxxqymliay469fphdw22cyar6qiph9iv5qpswxva";
      }
      {
        name = "language-haskell";
        publisher = "justusadam";
        version = "3.2.0";
        sha256 = "190h1hky2yy5n00ncqf15mmaizgpm3w9pzvasmi2gangpg4qb6y5";
      }
      {
        name = "terraform";
        publisher = "HashiCorp";
        version = "2.0.2";
        sha256 = "0dfwg5j8jm1ywiknsasrfbsrbl0ax8bbjm7pyrp9n05l6y7r29cy";
      }
      {
        name = "vscode-kubernetes-tools";
        publisher = "ms-kubernetes-tools";
        version = "1.2.0";
        sha256 = "1cvh1cidqglvk5bcrwx9jgk73d64pj278wxyz4llpzfdns4hmcqr";
      }
      {
        name = "scala";
        publisher = "scala-lang";
        version = "0.3.9";
        sha256 = "0l6zrpp2klqdym977zygmbzf0478lbqmivcxa2xmqyi34c9vwli7";
      }
      {
        name = "metals";
        publisher = "scalameta";
        version = "1.9.0";
        sha256 = "0p2wbnw98zmjbfiz4mi1mh131s78r01kjnja339lwdigqxg88gi6";
      }
      {
        name = "vim";
        publisher = "vscodevim";
        version = "1.14.1";
        sha256 = "179kqs6qpm57d43i02l25mga9rxk0cmmzxbl0ydgdjw7xlk2r0i1";
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
        version = "0.4.2";
        sha256 = "05da62iahnnjxkgdav14c1gn90lkgyk9gc5rardsqijx2x6dgjn0";
      }
      {
        name = "vscode-yaml";
        publisher = "redhat";
        version = "0.8.0";
        sha256 = "08dy5wm24c3bga698925pjwbymdmxi00a84d6xajj750pax7grz0";
      }
      {
        name = "xml";
        publisher = "DotJoshJohnson";
        version = "2.5.0";
        sha256 = "1fifdxgfqf3sw6rhbsvcsl8p39hnarcl0akapa94a8axrg9bdwca";
      }
    ];
  };
}

(lib.mkIf pkgs.stdenv.isDarwin {
  programs.vscode.userSettings = {
    "terminal.integrated.shell.osx" = with builtins; "${getEnv "HOME"}/.nix-profile/bin/zsh";
  };
})]
