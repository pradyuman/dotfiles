{ pkgs, ... }:

{
  programs.wezterm = {
    enable = true;
    enableZshIntegration = true;
    extraConfig = ''
      local wezterm = require 'wezterm'
      local config = wezterm.config_builder()

      config.color_scheme = 'zenwritten_dark'
      config.font = wezterm.font 'Hasklig'
      config.font_size = 11.5

      config.command_palette_bg_color = '1c1917'
      config.command_palette_fg_color = 'b4bdc3'
      config.command_palette_font_size = 12.5
      config.enable_tab_bar = false

      return config
    '';
  };

}