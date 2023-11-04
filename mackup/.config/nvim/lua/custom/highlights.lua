local M = {}

---@type Base46HLGroupsList
M.override = {
  -- imports
  Include = {
    bold = true,
    italic = true,
  },
  -- for, while loops
  Repeat = {
    bold = true,
    italic = true,
  },
  -- if statements
  Conditional = {
    bold = true,
    italic = true,
  },
  -- class, with, as keywords
  ["@keyword"] = {
    bold = true,
    italic = true,
  },
  -- function keyword
  ["@keyword.function"] = {
    bold = true,
    italic = true,
  },
  -- return, yield keywords
  ["@keyword.return"] = {
    bold = true,
    italic = true,
  },
  -- function names
  ["@function"] = {
    italic = false,
  },
  -- symbolic
  ["@operator"] = {
    bold = true,
    italic = true,
  },
  -- logical keywords 
  ["@keyword.operator"] = {
    bold = true,
    italic = true,
  },
  -- function parameters
  ["@parameter"] = {
    italic = true,
  },
  ["@text.literal"] = {
    bold = true,
    italic = true,
  },
}

---@type HLTable
-- M.add = {
--   NvimTreeOpenedFolderName = { fg = "green", bold = true },
-- }

return M
