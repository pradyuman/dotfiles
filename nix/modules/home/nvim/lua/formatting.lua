local conform = require("conform")

conform.setup({
  default_format_opts = { lsp_format = "fallback" },
  format_on_save = true,
  formatters_by_ft = {
    javascript = { "biome-check" },
    javascriptreact = { "biome-check" },
    json = { "biome-check" },
    jsonc = { "biome-check" },
    lua = { "stylua" },
    nix = { "nixfmt" },
    rust = { "rustfmt" },
    typescript = { "biome-check" },
    typescriptreact = { "biome-check" },
  },
})
