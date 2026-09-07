-- Use Space as the leader and local leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Show line numbers
vim.opt.number = true

-- Hide the tab bar
vim.opt.showtabline = 0

-- The statusline already shows the mode
vim.opt.showmode = false

-- Show the command line over the bottom row only when needed
vim.opt.cmdheight = 0

-- Ignore case unless the search contains a capital letter
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Open new splits to the right and below
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Theme
vim.opt.termguicolors = true
vim.cmd.colorscheme("zenbadger")

-- Modules
require("clue")
require("completion")
require("diff")
require("formatting")
require("git")
require("icons")
require("jump")
require("keymap")
require("lsp")
require("picker")
require("statusline")
require("tree")

-- Use Tree-sitter when available
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("TreesitterHighlight", { clear = true }),
  callback = function(event)
    pcall(vim.treesitter.start, event.buf)
  end,
})
