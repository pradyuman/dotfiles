local color = require("utils.color")

-- Configure Rustaceanvim's code action fallback and floating windows
vim.g.rustaceanvim = {
  tools = {
    code_actions = { ui_select_fallback = true },
    float_win_config = {
      auto_focus = true,
      border = "rounded",
      max_width = 120,
    },
  },
}

-- Run Clippy when checking Rust code
vim.lsp.config("rust-analyzer", {
  settings = {
    ["rust-analyzer"] = {
      check = { command = "clippy" },
    },
  },
})

-- Configure RustOwl's crate root and ownership highlights
vim.g.rustowl = {
  client = {
    root_dir = function()
      return vim.fs.root(0, "Cargo.toml")
    end,
  },
  colors = {
    definitely_live = color.fg("Comment"),
    maybe_initialized = color.fg("Comment"),
    imm_borrow = color.fg("DiagnosticInfo"),
    mut_borrow = color.fg("Identifier"),
    move = color.fg("DiagnosticWarn"),
    call = color.fg("Function"),
    shared_mut = color.fg("DiagnosticError"),
    outlive = color.fg("DiagnosticError"),
  },
}

-- Add Rust-specific pairs and commands to Rust buffers
vim.api.nvim_create_autocmd("FileType", {
  pattern = "rust",
  callback = function(event)
    vim.b[event.buf].miniclue_config = {
      clues = {
        { mode = "n", keys = "<leader>cl", desc = "+Lang" },
      },
    }

    -- Pair pipes when writing Rust closures
    require("mini.pairs").map_buf(event.buf, "i", "|", {
      action = "closeopen",
      pair = "||",
      neigh_pattern = "^[^\\]",
      register = { cr = false },
    })

    local function map(keys, command, description)
      vim.keymap.set("n", keys, "<Cmd>RustLsp " .. command .. "<CR>", {
        buffer = event.buf,
        desc = description,
        silent = true,
      })
    end

    -- Rustaceanvim commands
    map("<leader>ca", "codeAction", "Code actions")
    map("<leader>cle", "explainError current", "Explain error")
    map("<leader>clh", "hover actions", "Hover actions")
    map("<leader>clm", "expandMacro", "Expand macro")
    map("<leader>clr", "runnables", "Runnables")
    map("<leader>clt", "testables", "Testables")

    -- RustOwl ownership visualization
    vim.keymap.set("n", "<leader>clo", "<Cmd>Rustowl toggle<CR>", {
      buffer = event.buf,
      desc = "Visualize ownership",
      silent = true,
    })
  end,
})
