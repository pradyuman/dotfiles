require("blink.cmp").setup({
  keymap = { preset = "super-tab" },
  completion = {
    documentation = { auto_show = true },
  },
  signature = { enabled = true },
  cmdline = {
    keymap = {
      preset = "cmdline",
      ["<Down>"] = { "select_next", "fallback" },
      ["<Up>"] = { "select_prev", "fallback" },
    },
    completion = {
      menu = {
        auto_show = function()
          return vim.fn.getcmdtype() == ":"
        end,
      },
    },
  },
})
