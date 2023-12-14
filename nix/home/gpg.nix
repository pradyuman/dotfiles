{ pkgs, ... }:

{
  programs.gpg = {
    enable = true;
    settings = {
      default-key = "4378CA1B422BBB4C";
    };
  };
}