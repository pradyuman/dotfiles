# List recipes (default command)
@list:
  just --list

init-nix-darwin hostname:
  nix run nix-darwin switch --flake ./nix

darwin-rebuild *args:
  darwin-rebuild {{ args }} --flake ./nix
