{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    hasklig
    nerd-fonts.symbols-only
  ];
}
