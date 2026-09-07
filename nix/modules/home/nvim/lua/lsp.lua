-- Show diagnostics in a floating window
vim.diagnostic.config({
  virtual_text = false,
  virtual_lines = false,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = " ●",
      [vim.diagnostic.severity.WARN] = " ●",
      [vim.diagnostic.severity.INFO] = " ●",
      [vim.diagnostic.severity.HINT] = " ●",
    },
  },
  float = {
    border = "rounded",
    source = "if_many",
    max_width = 80,
  },
})

-- Show diagnostics when the cursor pauses on an issue
vim.opt.updatetime = 400
vim.api.nvim_create_autocmd("CursorHold", {
  group = vim.api.nvim_create_augroup("DiagnosticHover", { clear = true }),
  callback = function()
    vim.diagnostic.open_float({ scope = "cursor", focusable = false })
  end,
})

-- Run Clippy when checking Rust code
vim.lsp.config("rust_analyzer", {
  settings = {
    ["rust-analyzer"] = {
      check = { command = "clippy" },
    },
  },
})

-- Recognize Neovim's vim global in Lua configuration
vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      diagnostics = { globals = { "vim" } },
    },
  },
})
