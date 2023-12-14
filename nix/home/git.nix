{
  programs.git = {
    enable = true;

    userEmail = "me@pmn.co";
    userName = "Pradyuman Vig";

    signing = {
      signByDefault = true;
      key = "4378CA1B422BBB4C";
    };

    ignores = [
      ".metals"
    ];

    delta = {
      enable = true;
    };

    extraConfig = {
      github = {
        user = "pradyuman";
      };
    };
  };
}
