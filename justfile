# List recipes (default command)
@list:
  just --list

init-nix-darwin hostname:
  nix run nix-darwin \
    --extra-experimental-features 'nix-command flakes' \
    -- switch --flake ./nix
