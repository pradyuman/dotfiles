{ config, ... }:

{
  homebrew = {
    enable = true;

    onActivation.cleanup = "uninstall";
    taps = builtins.attrNames config.nix-homebrew.taps;

    casks = [
      "1password"
      "aside"
      "claude"
      "cleanshot"
      "codex-app"
      "cursor"
      "discord"
      "figma"
      "ghostty"
      "microsoft-office"
      "music-presence"
      "notion"
      "numi"
      "tableplus"
      "wallspace"
    ];

    masApps = {
      "1Password for Safari" = 1569813296;
    };
  };
}
