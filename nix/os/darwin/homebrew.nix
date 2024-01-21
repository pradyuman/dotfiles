{
  imports = [ <home-manager/nix-darwin> ];

  homebrew = {
    enable = true;

    casks = [
      "1password"
      "arc"
      "discord"
      "figma"
      "spotify"
      "wezterm"
    ];
  };

  home-manager.users.pmn.programs.zsh.profileExtra = ''
    eval "$(/opt/homebrew/bin/brew shellenv)"
  '';
}