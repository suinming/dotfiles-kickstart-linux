local wezterm = require("wezterm")
local act = wezterm.action
local theme = wezterm.plugin.require('https://github.com/neapsix/wezterm').main
local config = {}
config.font = wezterm.font("JetBrainsMono-Bold")
config.font_size = 16
config.colors = theme.colors()

-- workspace switcher plugin
local workspace_switcher = wezterm.plugin.require("https://github.com/MLFlexer/smart_workspace_switcher.wezterm")
workspace_switcher.zoxide_path = "/home/suinming/.local/bin/zoxide"
config.leader = { key = ' ', mods = 'CTRL', timeout_milliseconds = 1000 }
config.keys = {
  {
    mods   = "LEADER",
    key    = "t",
    action = workspace_switcher.switch_workspace()
  },
  {
    mods   = "LEADER",
    key    = "s",
    action = act.ShowLauncherArgs({ flags = "FUZZY|WORKSPACES" })
  },
}

-- tab bar plugin
local bar = wezterm.plugin.require("https://github.com/adriankarlen/bar.wezterm")
bar.apply_to_config(
  config,
  {
    position = "top",
    separator = {
      space = 2,
    },
    modules = {
      workspace = {
        enabled = true,
      },
      leader = {
        enabled = false,
      },
      pane = {
        enabled = false,
      },
      username = {
        enabled = false,
      },
      hostname = {
        enabled = false,
      },
      clock = {
        enabled = false,
      },
      cwd = {
        enabled = false,
      },
    },
  }
)

return config
