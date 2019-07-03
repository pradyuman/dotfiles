{
  programs.ssh = {
    enable = true;
    extraConfig = ''
      AddKeysToAgent yes
      IdentityFile ~/.ssh/id_rsa
    '';
  };
}