local map = vim.keymap.set
local jump = require("mini.jump2d")
local pick = require("mini.pick")
local picker = require("picker")

-- Buffers
map("n", "<leader>bd", "<Cmd>bdelete<CR>", { desc = "Delete buffer" })
map("n", "<leader>be", "<Cmd>Neotree buffers focus<CR>", { desc = "Buffer explorer" })
map("n", "<leader>bi", pick.builtin.buffers, { desc = "Pick buffer" })
map("n", "<leader>bn", "<Cmd>bnext<CR>", { desc = "Next buffer" })
map("n", "<leader>bp", "<Cmd>bprevious<CR>", { desc = "Previous buffer" })

-- Code
map({ "n", "x" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" })

map({ "n", "x" }, "<leader>cf", require("conform").format, { desc = "Format" })

map("n", "<leader>ch", function()
  vim.lsp.buf.hover({ border = "rounded", max_width = 120 })
end, { desc = "Documentation" })

map("n", "<leader>cr", vim.lsp.buf.rename, { desc = "Rename symbol" })

map("n", "<leader>cs", function()
  require("mini.extra").pickers.lsp({ scope = "document_symbol" })
end, { desc = "Document symbols" })

map("n", "<leader>cx", function()
  require("mini.extra").pickers.diagnostic({ scope = "current" })
end, { desc = "Buffer diagnostics" })

map("n", "<leader>cX", function()
  require("mini.extra").pickers.diagnostic()
end, { desc = "All diagnostics" })

-- Files
map("n", "<leader>e", "<Cmd>Neotree filesystem toggle<CR>", { desc = "File explorer" })
map("n", "<leader>fe", "<Cmd>Neotree filesystem reveal<CR>", { desc = "Reveal file in explorer" })
map("n", "<leader>ff", pick.builtin.files, { desc = "Find files" })
map("n", "<leader>fs", "<Cmd>write<CR>", { desc = "Save file" })
map("n", "<leader>fS", "<Cmd>wall<CR>", { desc = "Save all modified files" })

-- Git
map("n", "<leader>gd", "<Cmd>CodeDiff<CR>", { desc = "Diff changes" })
map("n", "<leader>ge", "<Cmd>Neotree git_status focus<CR>", { desc = "Git changes explorer" })
map("n", "<leader>gg", "<Cmd>Neogit<CR>", { desc = "Git status" })

-- Search
map("n", "<leader>sb", function()
  require("mini.extra").pickers.buf_lines({ scope = "current" })
end, { desc = "Search buffer" })

map("n", "<leader>sh", function()
  require("mini.extra").pickers.history({ scope = "/" })
end, { desc = "Search history" })

map({ "n", "x", "o" }, "<leader>sj", function()
  jump.start(jump.builtin_opts.word_start)
end, { desc = "Jump" })

map("n", "<leader>sp", picker.search_project, { desc = "Search project" })
map({ "n", "x" }, "<leader>sr", function()
  require("grug-far").open()
end, { desc = "Search and replace" })

map("n", "<leader>sR", pick.builtin.resume, { desc = "Resume last picker" })

-- Tabs
map("n", "<leader><Tab>d", "<Cmd>tabclose<CR>", { desc = "Close tab" })
map("n", "<leader><Tab>n", "<Cmd>tabnew<CR>", { desc = "Create new tab" })

map("n", "<leader><Tab>r", function()
  local tab = vim.api.nvim_get_current_tabpage()
  vim.ui.input({ prompt = "Tab name: ", default = vim.t[tab].name or "" }, function(name)
    if name ~= nil and vim.api.nvim_tabpage_is_valid(tab) then
      vim.t[tab].name = vim.trim(name)
    end
  end)
end, { desc = "Rename tab" })

map("n", "<leader><Tab><Tab>", picker.tabs, { desc = "Pick tab" })

-- Windows
map("n", "<leader>w", "<C-w>", { remap = true, desc = "+Windows" })
