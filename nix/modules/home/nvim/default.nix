{
  inputs,
  lib,
  pkgs,
  ...
}:

let
  codediff-watcher-version = "0.23.2";
  codediff-watcher = pkgs.fetchzip {
    url = "https://github.com/esmuellert/codediff/releases/download/v${codediff-watcher-version}/codediff-watcher-${codediff-watcher-version}-macos-arm64.tar.gz";
    hash = "sha256-IiWOlWRh+dFHEhKvBXUTafEbrOLvhXA9RnYvZm5BdaE=";
    stripRoot = false;
  };

  lsp-servers = with pkgs; {
    # Languages
    bashls = bash-language-server;
    lua_ls = lua-language-server;
    nixd = nixd;
    ts_ls = typescript-language-server;

    # Web
    biome = biome;
    cssls = vscode-langservers-extracted;
    html = vscode-langservers-extracted;

    # Data and documents
    jsonls = vscode-langservers-extracted;
    marksman = marksman;
    taplo = taplo;
    yamlls = yaml-language-server;
  };
  rustowl = inputs.rustowl.packages.${pkgs.system};
in
{
  programs.neovim = {
    enable = true;
    sideloadInitLua = true;

    plugins = with pkgs.vimPlugins; [
      blink-cmp
      codediff-nvim
      conform-nvim
      grug-far-nvim
      lualine-nvim
      mini-clue
      mini-extra
      mini-icons
      mini-jump2d
      mini-pairs
      mini-pick
      neo-tree-nvim
      neogit
      nvim-lspconfig
      nvim-treesitter.withAllGrammars
      rustaceanvim
      rustowl.rustowl-nvim
      zen-nvim
    ];

    extraPackages = lib.unique (builtins.attrValues lsp-servers) ++ [
      rustowl.rustowl
      pkgs.rust-analyzer
      pkgs.stylua
    ];

    initLua = ''
      vim.env.CODEDIFF_WATCHER_PATH = "${codediff-watcher}/codediff-watcher"
      vim.lsp.enable(vim.json.decode([=[${builtins.toJSON (builtins.attrNames lsp-servers)}]=]))
    '';
  };

  xdg.configFile."nvim".source = ./.;
}
