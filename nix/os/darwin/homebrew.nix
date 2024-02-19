{ home-manager, ... }:

{
  homebrew = {
    enable = true;

    casks = [
      "1password"
      "arc"
      "discord"
      "figma"
      "wezterm"
    ];
  };

  home-manager.users.pmn.programs.zsh.profileExtra = ''
    eval "$(/opt/homebrew/bin/brew shellenv)"
  '';
}