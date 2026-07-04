{
  homebrew = {
    enable = true;

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
