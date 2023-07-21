{ pkgs, config, ... }:

{
  programs.vscode = {
    enable = true;

    userSettings = {
      "editor.codeActionsOnSave" = [
        "source.organizeImports"
        "source.fixAll.eslint"
      ];
      "editor.formatOnSave" = true;
      "editor.tabSize" = 2;
      "eslint.validate" = [
        "javascript"
        "javascriptreact"
        "typescript"
        "typescriptreact"
      ];
      "eslint.workingDirectories" = [
        { "mode" = "auto"; }
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
      "yaml.completion" = true;
      "yaml.format.enable" = true;
      "yaml.schemaStore.enable" = true;
      "yaml.validate" = true;
    };

    extensions = with pkgs.vscode-extensions; [
      apollographql.vscode-apollo
      bbenoist.nix
      eamodio.gitlens
      dbaeumer.vscode-eslint
      hashicorp.terraform
      ms-azuretools.vscode-docker
      prisma.prisma
      redhat.vscode-yaml
      scala-lang.scala
      scalameta.metals
      styled-components.vscode-styled-components
      vscodevim.vim
      wix.vscode-import-cost
      zxh404.vscode-proto3
    ];
  };
}
