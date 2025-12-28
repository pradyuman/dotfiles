{
  programs.git = {
    enable = true;

    signing = {
      signByDefault = true;
      key = "4378CA1B422BBB4C";
    };

    ignores = [
      ".aider*"
      ".metals"
    ];

    settings = {
      user = {
        email = "me@pmn.co";
        name = "Pradyuman Vig";
      };

      github = {
        user = "pradyuman";
      };
    };
  };

  programs.delta = {
    enable = true;
    enableGitIntegration = true;
  };
}
