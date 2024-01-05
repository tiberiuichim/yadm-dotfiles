local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

print("Hello world")

config.default_prog = { "/usr/bin/fish", "-l" }
config.warn_about_missing_glyphs = false

return config
