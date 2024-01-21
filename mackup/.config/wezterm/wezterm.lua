local k = require("utils/keys")
local wezterm = require("wezterm")
local act = wezterm.action

local config = {
  font = wezterm.font 'MonoLisa',
  font_size = 13.5,
  color_scheme = 'Catppuccin Mocha',
  -- window_background_opacity = 1,
  window_background_opacity = 0.94,
  macos_window_background_blur = 20,
  default_cursor_style = 'BlinkingBlock',
  audible_bell = "Disabled",
  adjust_window_size_when_changing_font_size = false,
  debug_key_events = false,
  enable_tab_bar = false,
  window_close_confirmation = "NeverPrompt",
  window_decorations = "RESIZE",

  keys = {
    { key = "3", mods = "OPT", action = act.SendKey({key="#"})},
    {
      key = 't',
      mods = 'CMD',
      action = act.DisableDefaultAssignment,
    },
    {
      key = '[',
      mods = 'CMD|SHIFT',
      action = act.DisableDefaultAssignment,
    },
    {
      key = ']',
      mods = 'CMD|SHIFT',
      action = act.DisableDefaultAssignment,
    },
    {
      key = '{',
      mods = 'CMD',
      action = act.DisableDefaultAssignment,
    },
    {
      key = '}',
      mods = 'CMD',
      action = act.DisableDefaultAssignment,
    },
    k.cmd_shift_tmux("e", "%"),
		k.cmd_key("[", act.SendKey({ mods = "CTRL", key = "o" })),
		k.cmd_key("]", act.SendKey({ mods = "CTRL", key = "i" })),
		k.cmd_key("f", k.multiple_actions("lfcd")),
		-- k.cmd_key("H", act.SendKey({ mods = "CTRL", key = "h" })),
		-- k.cmd_key("J", act.SendKey({ mods = "CTRL", key = "j" })),
		-- k.cmd_key("K", act.SendKey({ mods = "CTRL", key = "k" })),
		-- k.cmd_key("L", act.SendKey({ mods = "CTRL", key = "l" })),
		k.cmd_key("q", k.multiple_actions(":qa!")),
		k.cmd_key("s", k.multiple_actions(":w")),
		k.cmd_to_tmux_prefix("1", "1"),
		k.cmd_to_tmux_prefix("2", "2"),
		k.cmd_to_tmux_prefix("3", "3"),
		k.cmd_to_tmux_prefix("4", "4"),
		k.cmd_to_tmux_prefix("5", "5"),
		k.cmd_to_tmux_prefix("6", "6"),
		k.cmd_to_tmux_prefix("7", "7"),
		k.cmd_to_tmux_prefix("8", "8"),
		k.cmd_to_tmux_prefix("9", "9"),
		k.cmd_to_tmux_prefix("`", "n"),
		k.cmd_to_tmux_prefix("b", "B"),
		k.cmd_to_tmux_prefix("C", "C"),
		k.cmd_to_tmux_prefix("d", "D"),
		k.cmd_to_tmux_prefix("e", '"'),
    k.cmd_to_tmux_prefix("E", "%"),
		k.cmd_to_tmux_prefix("G", "G"),
		k.cmd_to_tmux_prefix("g", "g"),
		k.cmd_to_tmux_prefix("j", "T"),
		k.cmd_to_tmux_prefix("k", "s"),
		k.cmd_to_tmux_prefix("l", "L"),
		k.cmd_to_tmux_prefix("n", '"'),
		k.cmd_to_tmux_prefix("N", "%"),
		k.cmd_to_tmux_prefix("o", "u"),
		k.cmd_to_tmux_prefix("t", "c"),
		k.cmd_to_tmux_prefix("T", "!"),
		k.cmd_to_tmux_prefix("w", "x"),
		k.cmd_to_tmux_prefix("z", "z"),
		k.cmd_to_tmux_prefix(";", ":"),
		k.cmd_shift_tmux("{", "p"),
		k.cmd_shift_tmux("}", "n"),
  },
}

return config
