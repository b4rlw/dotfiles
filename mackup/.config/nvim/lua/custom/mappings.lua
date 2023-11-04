local M = {}

M.disabled = {
  n = {
    ["<C-h>"] = "",
    ["<C-j>"] = "",
    ["<C-k>"] = "",
    ["<C-l>"] = "",
  }
}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {"<cmd> DapToggleBreakpoint <CR>"}
  }
}

M.dap_python = {
  plugin = true,
  n = {
    ["<leader>dpr"] = {
      function()
        require('dap-python').test_method()
      end
    }
  }
}

-- M.telescope = {
--   plugin = true,
--
--   n = {
--     -- find
--     ["<leader>fa"] = { "<cmd> Telescope find_files follow=true hidden=true <CR>", "Find all" },
--   },
-- }

return M
