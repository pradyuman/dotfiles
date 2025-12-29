{
  homebrew = {
    enable = true;

    casks = [
      "1password"
      "arc"
      "cursor"
      "discord"
      "ghostty"
      "figma"
      "numi"
    ];
  };

  home-manager.users.pmn.programs.zsh.profileExtra = ''
    eval "$(/opt/homebrew/bin/brew shellenv)"
  '';
}
