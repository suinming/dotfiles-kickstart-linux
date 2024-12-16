local wezterm = require("wezterm")
local act = wezterm.action
local theme = wezterm.plugin.require('https://github.com/neapsix/wezterm').main

local config = {}

config.font = wezterm.font("JetBrainsMono-Bold")
config.font_size = 16
config.colors = theme.colors()
config.hide_tab_bar_if_only_one_tab = false
config.use_fancy_tab_bar = false

local SOLID_LEFT_ARROW = wezterm.nerdfonts.pl_right_hard_divider

local SOLID_RIGHT_ARROW = wezterm.nerdfonts.pl_left_hard_divider

config.tab_bar_style = {
  active_tab_left = wezterm.format {
    { Background = { Color = '#0b0022' } },
    { Foreground = { Color = '#2b2042' } },
    { Text = SOLID_LEFT_ARROW },
  },
  active_tab_right = wezterm.format {
    { Background = { Color = '#0b0022' } },
    { Foreground = { Color = '#2b2042' } },
    { Text = SOLID_RIGHT_ARROW },
  },
  inactive_tab_left = wezterm.format {
    { Background = { Color = '#0b0022' } },
    { Foreground = { Color = '#1b1032' } },
    { Text = SOLID_LEFT_ARROW },
  },
  inactive_tab_right = wezterm.format {
    { Background = { Color = '#0b0022' } },
    { Foreground = { Color = '#1b1032' } },
    { Text = SOLID_RIGHT_ARROW },
  },
}

-- print the workspace name at the upper right
wezterm.on("update-right-status", function(window, pane)
  window:set_right_status(window:active_workspace())
end)

-- workspace 
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

-- tab
local function get_current_working_dir(tab)
  local current_dir = tab.active_pane and tab.active_pane.current_working_dir or { file_path = "" }
  local HOME_DIR = string.format("file://%s", os.getenv("HOME"))

  return current_dir == HOME_DIR and "." or string.gsub(current_dir.file_path, "(.*[/\\])(.*)", "%2")
end

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
  local has_unseen_output = false
  if not tab.is_active then
    for _, pane in ipairs(tab.panes) do
      if pane.has_unseen_output then
        has_unseen_output = true
        break
      end
    end
  end

  local cwd = wezterm.format({
    { Attribute = { Intensity = "Bold" } },
    { Text = get_current_working_dir(tab) },
  })

  local title = string.format(" [%s] %s ", tab.tab_index + 1, cwd)

  if has_unseen_output then
    return {
      { Foreground = { Color = "#8866bb" } },
      { Text = title },
    }
  end

  return {
    { Text = title },
  }
end)

return config
