local wezterm = require("wezterm")
local cp = require("cross-platform")

local act = wezterm.action

-- local color = require("color")
-- local color_fg, color_bg = color.fg, color.bg

wezterm.on('format-tab-title', function(tab, tabs, panes, config, hover, max_width)
	-- local title = (function(tab_info)
	-- 	local title = tab_info.tab_title
	-- 	if title and #title > 0 then return title end
	-- 	return tab_info.active_pane.title:gsub("%.exe", "")
	-- end)(tab)

	local title = (function(tab_info)
		return string.format(" %s ", tab_info.tab_index + 1)
	end)(tab)

	return {
		{ Text = ' ' .. title .. ' ' },
	}
end)

wezterm.on('update-right-status', function(window, pane)
	local date = wezterm.strftime '%-l:%M %P'
	window:set_right_status(wezterm.format {
		{ Text = ' ' .. date .. ' ' }
	})
end)


local ret = {
	-- ╭──────────────────────────────────────────────────────────────────────────────╮
	-- │  Basic                                                                       │
	-- ╰──────────────────────────────────────────────────────────────────────────────╯
	default_prog = cp.default_prog,
	use_dead_keys = false,
	native_macos_fullscreen_mode = true,
	check_for_updates = false,
	-- ╭──────────────────────────────────────────────────────────────────────────────╮
	-- │  UI                                                                          │
	-- ╰──────────────────────────────────────────────────────────────────────────────╯
	-- window_decorations = "INTEGRATED_BUTTONS | RESIZE",
	-- window_decorations = "INTEGRATED_BUTTONS | RESIZE",
	window_decorations = cp.default_window_decorations,
	window_close_confirmation = "NeverPrompt",
	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	},
	-- ╭──────────────────────────────────────────────────────────────────────────────╮
	-- │  Font                                                                        │
	-- ╰──────────────────────────────────────────────────────────────────────────────╯
	font = wezterm.font("FiraCode Nerd Font Mono", { weight = "Bold" }),
	font_size = cp.font_size,
	text_background_opacity = 1,
	-- ╭──────────────────────────────────────────────────────────────────────────────╮
	-- │  Tab                                                                         │
	-- ╰──────────────────────────────────────────────────────────────────────────────╯
	tab_bar_at_bottom = true,
	show_tab_index_in_tab_bar = false,
	enable_tab_bar = true,
	hide_tab_bar_if_only_one_tab = true,
	-- hide_tab_bar_if_only_one_tab = true,
	adjust_window_size_when_changing_font_size = false,

	use_fancy_tab_bar = false,
	tab_bar_style = {
		window_hide = "  ",
		window_hide_hover = "  ",
		window_maximize = "  ",
		window_maximize_hover = "  ",
		window_close = "  ",
		window_close_hover = "  ",
	},

	-- ╭──────────────────────────────────────────────────────────────────────────────╮
	-- │  launch                                                                      │
	-- ╰──────────────────────────────────────────────────────────────────────────────╯
	launch_menu = cp.default_launch,
	-- ╭──────────────────────────────────────────────────────────────────────────────╮
	-- │  keys                                                                        │
	-- ╰──────────────────────────────────────────────────────────────────────────────╯
	disable_default_key_bindings = true,
	-- Note: echo $(wezterm show-keys) > ./Desktop/keys.md
	leader = { key = "L", mods = "CTRL", timeout_milliseconds = 1000 },
	keys = {
		-- -- ui
		{ key = "Enter", mods = "ALT",          action = wezterm.action.ToggleFullScreen },
		-- start manu
		{ key = "M",     mods = "CTRL",         action = act.ShowLauncherArgs({ flags = "LAUNCH_MENU_ITEMS" }) },
		-- copy and paste
		{ key = "Y",     mods = "CTRL",         action = act.ActivateCopyMode },
		{ key = "P",     mods = "CTRL",         action = act.PasteFrom("Clipboard") },
		-- pane operation
		{ key = "Q",     mods = "CTRL",         action = act.CloseCurrentPane({ confirm = false }) },
		-- pane split
		{ key = "v",     mods = "LEADER",       action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
		{ key = "h",     mods = "LEADER",       action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
		-- move at pane
		{ key = "w",     mods = "LEADER",       action = act.ActivatePaneDirection("Up") },
		{ key = "a",     mods = "LEADER",       action = act.ActivatePaneDirection("Left") },
		{ key = "s",     mods = "LEADER",       action = act.ActivatePaneDirection("Down") },
		{ key = "d",     mods = "LEADER",       action = act.ActivatePaneDirection("Right") },
		-- resize pane
		{ key = "W",     mods = "CTRL",         action = act.AdjustPaneSize({ "Up", 1 }) },
		{ key = "A",     mods = "CTRL",         action = act.AdjustPaneSize({ "Left", 1 }) },
		{ key = "S",     mods = "CTRL",         action = act.AdjustPaneSize({ "Down", 1 }) },
		{ key = "D",     mods = "CTRL",         action = act.AdjustPaneSize({ "Right", 1 }) },
		-- tab operation
		{ key = "Tab",   mods = "CTRL | SHIFT", action = act.ActivateTabRelative(-1) },
		{ key = "Tab",   mods = "CTRL",         action = act.ActivateTabRelative(1) },
		-- search
		{ key = "F",     mods = "CTRL",         action = act.Search({ CaseInSensitiveString = "hash" }) },
		-- open url
		{
			key = "p",
			mods = "LEADER",
			action = wezterm.action.QuickSelectArgs({
				label = "open url",
				patterns = {
					"https?://\\S+",
				},
				action = wezterm.action_callback(function(window, pane)
					local url = window:get_selection_text_for_pane(pane)
					wezterm.log_info("opening: " .. url)
					wezterm.open_with(url)
				end),
			}),
		},

	},
}

local special_settings = cp.special_settings
for key, value in pairs(special_settings) do
	ret[key] = value
end

return ret