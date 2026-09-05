# List recipes (default command)
@list:
  just --list

init-nix-darwin:
  sudo nix run nix-darwin -- switch --flake ./nix

darwin-rebuild *args:
  darwin-rebuild {{ args }} --flake ./nix
