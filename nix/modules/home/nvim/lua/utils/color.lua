local M = {}

-- Convert a packed 0xRRGGBB number to a hex string
function M.hex(color)
  return string.format("#%06x", color)
end

-- Read a highlight group's effective attributes
function M.hl(name)
  return vim.api.nvim_get_hl(0, { name = name, link = false })
end

-- Read a highlight group's foreground as a hex string
function M.fg(name)
  return M.hex(M.hl(name).fg)
end

return M
