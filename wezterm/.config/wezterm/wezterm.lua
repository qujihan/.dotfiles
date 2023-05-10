local wezterm = require("wezterm")
local cp = require("cross-platform")
local act = wezterm.action

return {
	default_prog = cp.default_prog,
	color_scheme = "tokyonight(Gogh)",
	use_dead_keys = false,
	native_macos_fullscreen_mode = true,
	check_for_updates = false,
	-- ╭──────────────────────────────────────────────────────────────────────────────╮
	-- │  Font                                                                        │
	-- ╰──────────────────────────────────────────────────────────────────────────────╯
	font = wezterm.font("FiraCode Nerd Font Mono"),
	font_size = cp.font_size,
	-- ╭──────────────────────────────────────────────────────────────────────────────╮
	-- │  Window                                                                      │
	-- ╰──────────────────────────────────────────────────────────────────────────────╯
	window_decorations = "RESIZE",
	window_background_opacity = 0.75,
	text_background_opacity = 0.75,
	window_close_confirmation = "NeverPrompt",
	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	},
	-- ╭──────────────────────────────────────────────────────────────────────────────╮
	-- │  Tab                                                                         │
	-- ╰──────────────────────────────────────────────────────────────────────────────╯
	use_fancy_tab_bar = false,
	tab_bar_at_bottom = true,
	enable_tab_bar = true,
	-- hide_tab_bar_if_only_one_tab = false,
	hide_tab_bar_if_only_one_tab = true,
	adjust_window_size_when_changing_font_size = false,
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
		{ key = "Enter", mods = "ALT", action = wezterm.action.ToggleFullScreen },
		-- start manu
		{ key = "M", mods = "CTRL", action = act.ShowLauncherArgs({ flags = "LAUNCH_MENU_ITEMS" }) },
		-- copy and paste
		{ key = "Y", mods = "CTRL", action = act.ActivateCopyMode },
		{ key = "P", mods = "CTRL", action = act.PasteFrom("Clipboard") },
		-- pane operation
		{ key = "Q", mods = "CTRL", action = act.CloseCurrentPane({ confirm = false }) },
		-- pane split
		{ key = "v", mods = "LEADER", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
		{ key = "h", mods = "LEADER", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
		-- move at pane
		{ key = "w", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
		{ key = "a", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
		{ key = "s", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
		{ key = "d", mods = "LEADER", action = act.ActivatePaneDirection("Right") },
		-- resize pane
		{ key = "W", mods = "CTRL", action = act.AdjustPaneSize({ "Up", 1 }) },
		{ key = "A", mods = "CTRL", action = act.AdjustPaneSize({ "Left", 1 }) },
		{ key = "S", mods = "CTRL", action = act.AdjustPaneSize({ "Down", 1 }) },
		{ key = "D", mods = "CTRL", action = act.AdjustPaneSize({ "Right", 1 }) },
		-- tab operation
		{ key = "Tab", mods = "CTRL | SHIFT", action = act.ActivateTabRelative(-1) },
		{ key = "Tab", mods = "CTRL", action = act.ActivateTabRelative(1) },
		-- search
		{ key = "F", mods = "CTRL", action = act.Search({ CaseInSensitiveString = "hash" }) },
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
