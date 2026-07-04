{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;

    profiles.default = {
      userSettings = {
        "editor.fontFamily" = "Hasklig, Menlo, Monaco, 'Courier New', monospace";
        "editor.fontLigatures" = true;
        "editor.tabSize" = 2;
        "editor.formatOnSave" = true;
        "editor.codeActionsOnSave" = {
          "source.organizeImports" = "explicit";
          "source.fixAll.biome" = "explicit";
        };
        "[javascript]" = {
          "editor.defaultFormatter" = "biomejs.biome";
        };
        "[javascriptreact]" = {
          "editor.defaultFormatter" = "biomejs.biome";
        };
        "[typescript]" = {
          "editor.defaultFormatter" = "biomejs.biome";
        };
        "[typescriptreact]" = {
          "editor.defaultFormatter" = "biomejs.biome";
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
        github.copilot
        mattn.lisp
        ms-azuretools.vscode-docker
        ms-vscode-remote.remote-containers
        biomejs.biome
        prisma.prisma
        redhat.vscode-yaml
        scalameta.metals
        styled-components.vscode-styled-components
        vscodevim.vim
        wix.vscode-import-cost
        zxh404.vscode-proto3
      ];
    };
  };
}
