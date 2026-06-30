{
  homebrew = {
    enable = true;

    casks = [
      "1password"
      "arc"
      "claude"
      "codex-app"
      "cursor"
      "discord"
      "figma"
      "ghostty"
      "microsoft-office"
      "music-presence"
      "numi"
      "tableplus"
    ];
  };

  home-manager.users.pmn.programs.zsh.profileExtra = ''
    eval "$(/opt/homebrew/bin/brew shellenv)"
  '';
}
