local color = require("utils.color")

-- Use the active colorscheme as the source
local base = color.hl("Normal")

-- Blend 12% of an accent into the background
local function tint(accent)
  local result = 0
  -- Extract and blend each 8-bit channel from the packed 0xRRGGBB colors
  for shift = 0, 16, 8 do
    local bg = bit.band(bit.rshift(base.bg, shift), 255)
    local fg = bit.band(bit.rshift(accent, shift), 255)
    -- Round the blended channel and shift it back into the packed color
    result = result + math.floor(bg * 0.88 + fg * 0.12 + 0.5) * 2 ^ shift
  end
  return color.hex(result)
end

-- Give each editor mode a subtle accent
local function mode(group)
  local accent = group and color.hl(group).fg
  local style = {
    fg = color.hex(base.fg),
    bg = accent and tint(accent) or color.hex(base.bg),
  }
  return { a = style, b = style, c = style }
end

require("lualine").setup({
  options = {
    theme = {
      normal = mode(),
      insert = mode("String"),
      visual = mode("Identifier"),
      replace = mode("Error"),
      command = mode("Function"),
      terminal = mode("String"),
      inactive = mode(),
    },
    globalstatus = true,
    component_separators = "",
    section_separators = "",
  },
  sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {
      {
        "filename",
        path = 1,
        file_status = false,
        fmt = function(path)
          return path:match("^(.*[/\\])") or ""
        end,
        color = { fg = color.fg("Constant") },
        padding = { left = 1 },
      },
      {
        "filename",
        color = { fg = color.fg("Type"), gui = "bold" },
        padding = { right = 1 },
        symbols = { modified = " ●", readonly = " [readonly]" },
      },
    },
    lualine_x = { { "diagnostics", sections = { "error", "warn" } } },
    lualine_y = { { "location", fmt = vim.trim } },
    lualine_z = {
      {
        "branch",
        icons_enabled = false,
        separator = { left = "" },
        color = { fg = color.hex(base.fg), bg = color.fg("FloatBorder") },
      },
    },
  },
})
