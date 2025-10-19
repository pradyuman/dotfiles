{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;

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
