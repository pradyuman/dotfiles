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
      "codex-app"
      "cursor"
      "discord"
      "figma"
      "ghostty"
      "microsoft-office"
      "music-presence"
      "notion"
      "numi"
      "orion"
      "tableplus"
    ];

    masApps = {
      "1Password for Safari" = 1569813296;
    };
  };

  home-manager.users.pmn.programs.zsh.profileExtra = ''
    eval "$(/opt/homebrew/bin/brew shellenv)"
  '';
}
