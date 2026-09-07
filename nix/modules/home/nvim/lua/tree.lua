local function root_name(source, suffix)
  return function(config, node, state)
    local name = require("neo-tree.sources." .. source .. ".components").name(config, node, state)
    if node:get_depth() == 1 and node.type == "directory" then
      name.text = vim.fn.fnamemodify(node.path, ":t") .. (suffix or "")
    end
    return name
  end
end

require("neo-tree").setup({
  buffers = {
    components = {
      name = root_name("buffers", " (buffers)"),
    },
  },
  filesystem = {
    filtered_items = {
      visible = false,
      hide_dotfiles = false,
      hide_gitignored = true,
      never_show = { ".git" },
    },
    components = {
      name = root_name("common"),
    },
  },
  git_status = {
    components = {
      name = root_name("git_status", " (git)"),
    },
  },
  window = {
    mappings = {
      ["<LeftRelease>"] = "open",
    },
  },
})
