local M = {}

---@type Base46HLGroupsList
M.override = {
  -- imports
  Include = {
    italic = true,
  },
  -- for, while loops
  Repeat = {
    italic = true,
  },
  -- if statements
  Conditional = {
    italic = true,
  },
  -- class, with, as keywords
  ["@keyword"] = {
    italic = true,
  },
  -- function keyword
  ["@keyword.function"] = {
    italic = true,
  },
  -- return, yield keywords
  ["@keyword.return"] = {
    bold = true,
  },
  -- function names
  ["@function"] = {
    italic = false,
  },
  -- symbolic
  ["@operator"] = {
    bold = true,
  },
  -- logical keywords 
  ["@keyword.operator"] = {
    italic = true,
  },
  -- function parameters
  ["@parameter"] = {
    italic = true,
  },
  ["@text.literal"] = {
    italic = true,
  },
}

---@type HLTable
-- M.add = {
--   NvimTreeOpenedFolderName = { fg = "green", bold = true },
-- }

return M
