{
  programs.git = {
    enable = true;

    userEmail = "me@pradyuman.co";
    userName = "Pradyuman Vig";

    signing = {
      signByDefault = true;
      key = "4F74D5361C4CA31E";
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