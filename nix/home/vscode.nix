{ pkgs, config, ... }:

{
  programs.vscode = {
    enable = true;

    userSettings = {
      "editor.fontFamily" = "Hasklig, Menlo, Monaco, 'Courier New', monospace";
      "editor.fontLigatures" = true;
      "editor.tabSize" = 2;
      "editor.formatOnSave" = true;
      "editor.codeActionsOnSave" = {
        "source.organizeImports" = "explicit";
        "source.fixAll.eslint" = "explicit";
      };
      "eslint.workingDirectories" = [
        { "mode" = "auto"; }
      ];
      "[javascript]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };
      "[javascriptreact]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };
      "[typescript]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };
      "[typescriptreact]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };
      "[scala]" = {
        "editor.defaultFormatter" = "scalameta.metals";
      };
      "update.mode" = "none";
      "vim.useSystemClipboard" = true;
      "yaml.completion" = true;
      "yaml.format.enable" = true;
      "yaml.schemaStore.enable" = true;
      "yaml.validate" = true;

      # Metals
      "metals.javaHome" = pkgs.openjdk8;
      "files.watcherExclude" = {
        "**/.bloop" = true;
        "**/.metals" = true;
        "**/.ammonite" = true;
      };
    };

    extensions = with pkgs.vscode-extensions; [
      apollographql.vscode-apollo
      bbenoist.nix
      eamodio.gitlens
      esbenp.prettier-vscode
      dbaeumer.vscode-eslint
      github.copilot
      mattn.lisp
      ms-azuretools.vscode-docker
      ms-vscode-remote.remote-containers
      prisma.prisma
      redhat.vscode-yaml
      scalameta.metals
      styled-components.vscode-styled-components
      vscodevim.vim
      wix.vscode-import-cost
      zxh404.vscode-proto3
    ];
  };
}
