-- Prevent CodeDiff from installing into the read-only Nix store
vim.env.CODEDIFF_WATCHER_NO_AUTO_INSTALL = "1"

require("codediff").setup({
  explorer = {
    auto_open_on_cursor = true,
    line_stats = {
      enabled = true,
      count_untracked = true,
    },
  },
  highlights = { char_brightness = 1.5 },
})
