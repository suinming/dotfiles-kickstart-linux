local wezterm = require("wezterm")

local theme = wezterm.plugin.require('https://github.com/neapsix/wezterm').main

local config = {}

config.font_size = 16
config.enable_tab_bar = false
config.colors = theme.colors()

return config
