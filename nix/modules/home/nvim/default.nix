{
  lib,
  pkgs,
  ...
}:

let
  lsp-servers = with pkgs; {
    # Languages
    bashls = bash-language-server;
    lua_ls = lua-language-server;
    nixd = nixd;
    rust_analyzer = rust-analyzer;
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
      mini-pick
      neo-tree-nvim
      neogit
      nvim-lspconfig
      nvim-treesitter.withAllGrammars
    ];

    extraPackages = lib.unique (builtins.attrValues lsp-servers) ++ [ pkgs.stylua ];

    initLua = ''
      vim.lsp.enable(vim.json.decode([=[${builtins.toJSON (builtins.attrNames lsp-servers)}]=]))
    '';
  };

  xdg.configFile."nvim".source = ./.;
}
