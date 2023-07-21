{
  programs.ssh = {
    enable = true;

    matchBlocks.github = {
      host = "github.com";
      identityFile = "~/.ssh/id_ed25519";
      extraOptions = {
        AddKeysToAgent = "yes";
        UseKeychain = "yes";
      };
    };
  };
}
