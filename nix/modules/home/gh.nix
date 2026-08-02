{ pkgs, ... }:

{
  programs.gh = {
    enable = true;
    extensions = with pkgs; [ gh-markdown-preview ];

    hosts."github.com" = {
      git_protocol = "ssh";
      user = "pradyuman";
      users.pradyuman = { };
    };
  };
}
