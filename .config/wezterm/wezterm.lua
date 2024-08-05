local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.font = wezterm.font("DejaVuSansM Nerd Font")
config.font_size = 10

config.enable_tab_bar = false

config.window_background_opacity = 0.9
config.text_background_opacity = 0.9

return config
