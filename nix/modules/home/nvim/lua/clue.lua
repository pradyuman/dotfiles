local clue = require("mini.clue")

clue.setup({
  triggers = {
    { mode = "n", keys = "<leader>" },
    { mode = "x", keys = "<leader>" },
    { mode = "n", keys = "<C-w>" },
  },
  clues = {
    clue.gen_clues.windows(),
    vim.tbl_map(function(window)
      window.keys = window.keys:gsub("<C%-w>", "<leader>w")
      return window
    end, clue.gen_clues.windows()),
    { mode = "n", keys = "<leader>b", desc = "+Buffers" },
    { mode = "n", keys = "<leader>c", desc = "+Code" },
    { mode = "x", keys = "<leader>c", desc = "+Code" },
    { mode = "n", keys = "<leader>f", desc = "+Files" },
    { mode = "n", keys = "<leader>g", desc = "+Git" },
    { mode = "n", keys = "<leader>s", desc = "+Search" },
    { mode = "x", keys = "<leader>s", desc = "+Search" },
    { mode = "n", keys = "<leader><Tab>", desc = "+Tabs" },
    { mode = "n", keys = "<leader>w", desc = "+Windows" },
  },
  window = {
    delay = 150,
    config = {
      width = "auto",
      border = "rounded",
    },
  },
})
