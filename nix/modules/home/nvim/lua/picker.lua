local pick = require("mini.pick")

pick.setup({
  window = {
    config = function()
      -- Inverse golden ratio
      local ratio = 0.618
      local height = math.floor(ratio * vim.o.lines)
      local width = math.floor(ratio * vim.o.columns)
      -- Center horizontally with a slight upward offset
      return {
        anchor = "NW",
        height = height,
        width = width,
        row = math.floor((1 - ratio) * (vim.o.lines - height)),
        col = math.floor(0.5 * (vim.o.columns - width)),
      }
    end,
  },
})

-- Keep code action menus compact and close to the cursor
vim.ui.select = function(items, opts, on_choice)
  if opts.kind ~= "codeaction" then
    return pick.ui_select(items, opts, on_choice)
  end

  local format_item = opts.format_item or tostring
  local width = vim.fn.strdisplaywidth(opts.prompt or "")
  for _, item in ipairs(items) do
    width = math.max(width, vim.fn.strdisplaywidth(format_item(item)))
  end

  return pick.ui_select(items, opts, on_choice, {
    window = {
      config = {
        relative = "cursor",
        anchor = "NW",
        row = 1,
        col = 0,
        width = width + 2,
        height = #items + 1,
      },
    },
  })
end

return {
  -- Custom picker for open tabs
  tabs = function()
    pick.ui_select(vim.api.nvim_list_tabpages(), {
      prompt = "Tabs",
      format_item = function(tab)
        local win = vim.api.nvim_tabpage_get_win(tab)
        local name = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(win))
        local label = vim.t[tab].name
        if not label or label == "" then
          label = name == "" and "[No Name]" or vim.fn.fnamemodify(name, ":t")
        end
        return string.format("%d: %s", vim.api.nvim_tabpage_get_number(tab), label)
      end,
    }, function(tab)
      if tab then
        vim.api.nvim_set_current_tabpage(tab)
      end
    end)
  end,

  search_project = function()
    local root = vim.fs.root(0, ".git") or vim.fs.root(vim.fn.getcwd(), ".git") or vim.fn.getcwd()
    pick.builtin.grep_live({ tool = "rg" }, { source = { cwd = root } })
  end,
}
