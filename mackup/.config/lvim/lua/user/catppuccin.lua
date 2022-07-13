local catppuccin = require("catppuccin")

-- configure it
catppuccin.setup({
  styles = {
    comments = "italic",
    conditionals = "italic",
    loops = "NONE",
    functions = "NONE",
    keywords = "italic",
    strings = "NONE",
    variables = "NONE",
    numbers = "NONE",
    booleans = "NONE",
    properties = "NONE",
    types = "NONE",
    operators = "italic",
  },
  integrations = {
    telescope = false,
    bufferline = false,
  },
})
catppuccin.load()
