{
  programs.zsh = {
    enable = true;

    localVariables = {
      GPG_TTY = "$(tty)";
    };

    autosuggestion.enable = true;
    enableCompletion = true;
  };
}
