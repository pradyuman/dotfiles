{ pkgs, ... }:

{
  programs.zellij = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      default_layout = "compact";
      pane_frames = false;
      simplified_ui = true;
    };
  };
}