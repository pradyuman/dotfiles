{
  inputs,
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
    ];

    extraPackages = lib.unique (builtins.attrValues lsp-servers) ++ [
      rustowl.rustowl
      pkgs.rust-analyzer
      pkgs.stylua
    ];

    initLua = ''
      vim.lsp.enable(vim.json.decode([=[${builtins.toJSON (builtins.attrNames lsp-servers)}]=]))
    '';
  };

  xdg.configFile."nvim".source = ./.;
}
