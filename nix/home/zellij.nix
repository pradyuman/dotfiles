{ pkgs, ... }:

{
  programs.zellij = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      default_layout = "compact";
      pane_frames = false;
      simplified_ui = true;

      theme = "zenwritten_dark";
      themes = {
        zenwritten_dark = {
          fg = "#bbbbbb";
          bg = "#191919";
          black = "#191919";
          red = "#de6e7c";
          green = "#819b69";
          yellow = "#b77e64";
          blue = "#6099c0";
          magenta = "#b279a7";
          cyan = "#66a5ad";
          white = "#bbbbbb";
          orange = "#b77e64";
        };
      };
    };
  };
}