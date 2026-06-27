{
  homebrew = {
    enable = true;

    casks = [
      "1password"
      "arc"
      "codex-app"
      "cursor"
      "discord"
      "figma"
      "ghostty"
      "music-presence"
      "numi"
      "tableplus"
    ];
  };

  home-manager.users.pmn.programs.zsh.profileExtra = ''
    eval "$(/opt/homebrew/bin/brew shellenv)"
  '';
}
