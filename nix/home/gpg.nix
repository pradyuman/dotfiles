{ pkgs, ... }:

{
  programs.gpg = {
    enable = true;
    settings = {
      default-key = "4F74D5361C4CA31E";
    };
  };

  services.gpg-agent.enable = true;
}