local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.default_prog = { "/usr/bin/fish", "-l" }
config.warn_about_missing_glyphs = false
config.window_decorations = "RESIZE"

-- wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
-- 	local pane_title = tab.active_pane.title
-- 	local user_title = tab.active_pane.user_vars.panetitle
--
-- 	if user_title ~= nil and #user_title > 0 then
-- 		pane_title = user_title
-- 	end
--
-- 	return {
-- 		{ Background = { Color = "blue" } },
-- 		{ Foreground = { Color = "white" } },
-- 		{ Text = " " .. pane_title .. " " },
-- 	}
-- end)
local act = wezterm.action

config.keys = {
	{
		key = "E",
		mods = "CTRL|SHIFT",
		action = act.PromptInputLine({
			description = "Enter new name for tab",
			action = wezterm.action_callback(function(window, pane, line)
				-- line will be `nil` if they hit escape without entering anything
				-- An empty string if they just hit enter
				-- Or the actual line of text they wrote
				if line then
					window:active_tab():set_title(line)
				end
			end),
		}),
	},
}

return config
