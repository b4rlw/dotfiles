-- general
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.format_on_save = { timeout = 5000 }
lvim.lsp.null_ls.setup.timeout_ms = 500

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
-- unmap a default keymapping
-- vim.keymap.del("n", "<C-Up>")
-- override a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
local _, actions = pcall(require, "telescope.actions")
lvim.builtin.telescope.defaults.mappings = {
  -- for input mode
  i = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
    ["<C-n>"] = actions.cycle_history_next,
    ["<C-p>"] = actions.cycle_history_prev,
  },
  -- for normal mode
  -- n = {
  --   ["<C-j>"] = actions.move_selection_next,
  --   ["<C-k>"] = actions.move_selection_previous,
  -- },
}
-- lvim.builtin.telescope.defaults.layout_strategy = "flex"
lvim.builtin.telescope = {
  -- active = true,
  defaults = {
    layout_strategy = "horizontal",
  },
  -- pickers = {
  --   git_files = {
  --     hidden = true,
  --   },
  --   live_grep = {
  --     hidden = true,
  --   },
  -- },
}

-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["t"] = {
  name = "+Trouble",
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble workspace_diagnostics<cr>", "Wordspace Diagnostics" },
}

-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
-- lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "right"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

vim.g.indent_blankline_bufname_exclude = { "README.md" }
vim.g.indent_blankline_buftype_exclude = { "terminal", "nofile" }
vim.g.indent_blankline_filetype_exclude = {
  "alpha",
  "log",
  "gitcommit",
  "dapui_scopes",
  "dapui_stacks",
  "dapui_watches",
  "dapui_breakpoints",
  "dapui_hover",
  "LuaTree",
  "dbui",
  "UltestSummary",
  "UltestOutput",
  "vimwiki",
  "markdown",
  "json",
  "txt",
  "vista",
  "NvimTree",
  "git",
  "TelescopePrompt",
  "undotree",
  "flutterToolsOutline",
  "org",
  "orgagenda",
  "help",
  "startify",
  "dashboard",
  "packer",
  "neogitstatus",
  "Outline",
  "Trouble",
  "lspinfo",
  "", -- for all buffers without a file type
}
-- vim.g.indent_blankline_char = "▏"
vim.g.indent_blankline_char = "│"
-- vim.g.indent_blankline_char_list = { "", "¦", "|", "¦", "" }
vim.g.indent_blankline_show_trailing_blankline_indent = false
vim.g.indent_blankline_show_first_indent_level = true
vim.g.indent_blankline_space_char_blankline = " "
vim.g.indent_blankline_use_treesitter = true
vim.g.indent_blankline_show_foldtext = false
vim.g.indent_blankline_show_current_context = true
vim.g.indent_blankline_show_current_context_start = false
vim.g.indent_blankline_context_patterns = {
  "class",
  "return",
  "function",
  "method",
  "^if",
  "^do",
  "^switch",
  "^while",
  "jsx_element",
  "^for",
  "^object",
  "^table",
  "block",
  "arguments",
  "if_statement",
  "else_clause",
  "jsx_element",
  "jsx_self_closing_element",
  "try_statement",
  "catch_clause",
  "import_statement",
  "operation_type",
}

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "black", filetypes = { "python" } },
  --     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
  --     extra_args = { "--print-with", "100" },
}

-- -- set additional linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "flake8", filetypes = { "python" } },
  -- { command = "pylint", filetypes = { "python" } },
  { command = "codespell", filetypes = { "python" } },
}

-- Additional Plugins
lvim.plugins = {
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  {
    "p00f/nvim-ts-rainbow",
  },
  -- {
  --   "lunarvim/Onedarker.nvim",
  -- },
  {
    "lunarvim/horizon.nvim",
  },
  -- {
  --   "lunarvim/synthwave84.nvim",
  -- },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      require("catppuccin").setup({
        flavour = "mocha", -- latte, frappe, macchiato, mocha
        -- background = { -- :h background
        --   light = "latte",
        --   dark = "mocha",
        -- },
        compile_path = vim.fn.stdpath("cache") .. "/catppuccin",
        transparent_background = false,
        -- term_colors = false,
        -- dim_inactive = {
        --   enabled = false,
        --   shade = "dark",
        --   percentage = 0.15,
        -- },
        styles = {
          comments = { "italic" },
          conditionals = { "italic" },
          loops = { "italic" },
          functions = {},
          keywords = { "italic" },
          strings = {},
          variables = {},
          numbers = {},
          booleans = {},
          properties = {},
          types = {},
          operators = { "italic" },
        },
        color_overrides = {},
        custom_highlights = {},
        integrations = {
          cmp = true,
          gitsigns = true,
          bufferline = true,
          nvimtree = {
            transparent_panel = false,
          },
          telescope = true,
          treesitter = true,
          -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
        },
      })
      -- vim.api.nvim_command "colorscheme catppuccin"
    end
  },
}
-- vim.g.catppuccin_flavour = "latte"
-- vim.g.catppuccin_flavour = "frappe"
-- vim.g.catppuccin_flavour = "macchiato"
-- vim.g.catppuccin_flavour = "mocha"
lvim.colorscheme = "catppuccin"
lvim.builtin.lualine.options.theme = "catppuccin"

vim.opt.relativenumber = true
lvim.transparent_window = true

vim.opt.foldlevel = 10
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

lvim.builtin.treesitter.rainbow = {
  enable = true,
  colors = {
    "Gold",
    "Orchid",
    "DodgerBlue",
    -- "Cornsilk",
    -- "Salmon",
    -- "LawnGreen",
  },
  disable = { "html" },
}

