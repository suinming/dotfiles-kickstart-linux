local wezterm = require("wezterm")
local act = wezterm.action
local theme = wezterm.plugin.require('https://github.com/neapsix/wezterm').main
local config = {}
config.font = wezterm.font("JetBrainsMono-Bold")
config.font_size = 16
config.colors = theme.colors()
config.enable_tab_bar = false 

return config
