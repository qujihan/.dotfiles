local wezterm = require("wezterm")
local act = wezterm.action
local cp = require("cross-platform")
local color = require("color")

wezterm.on("gui-startup", function(cmd)
	local _, _, window = wezterm.mux.spawn_window(cmd or {})
	window:gui_window():set_position(200, 200)
	-- window:gui_window():set_inner_size(1000, 750)
end)

wezterm.on('format-tab-title', function(tab, _, _, _, _, _)
	local pom_away = wezterm.nerdfonts.pom_away
	local index = string.format(" %s ", tab.tab_index + 1)
	local title = (function(tab_info)
		local shell_name = tab_info.active_pane.title
		if shell_name == "pwsh.exe" then
			return ""
		elseif shell_name == "zsh" then
			return ""
		elseif shell_name == "wslhost.exe" then
			return "󰌽"
		elseif shell_name == "wsl.exe" then
			return "󰌽"
		else
			return " "
		end
	end)(tab)

	return {
		-- { Text = ' ' .. pom_away .. " " ..  title .. " " },
		{ Text = " " .. index .. " " .. title .. " " },
	}
end)

wezterm.on('update-right-status', function(window, pane)
	local date = wezterm.strftime '%H:%M'
	window:set_right_status(wezterm.format {
		-- { Background = { Color = color.all_bg } },
		-- { Text = ' ' .. date .. ' ' }
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
	initial_cols = 90,
	initial_rows = 30,
	window_decorations = cp.default_window_decorations,
	window_close_confirmation = "NeverPrompt",
	window_padding = {
		left = 10,
		right = 10,
		top = 10,
		bottom = 10,
	},
	window_frame = {
		active_titlebar_bg = color.all_bg,
		inactive_titlebar_bg = color.all_bg,
		font_size = 12,
	},
	window_background_gradient = {
		colors = {
			color.all_bg,
			color.all_bg:darken(0.1),
			-- background_color:darken(0.2),
		},
		interpolation = "CatmullRom",
	},
	-- ╭──────────────────────────────────────────────────────────────────────────────╮
	-- │  Font                                                                        │
	-- ╰──────────────────────────────────────────────────────────────────────────────╯
	font = wezterm.font("FiraCode Nerd Font Mono", { weight = "Regular" }),
	font_size = cp.font_size,
	text_background_opacity = 1,
	-- ╭──────────────────────────────────────────────────────────────────────────────╮
	-- │  Tab                                                                         │
	-- ╰──────────────────────────────────────────────────────────────────────────────╯
	-- tab_bar_at_bottom = true,
	tab_bar_at_bottom = false,
	show_tab_index_in_tab_bar = false,
	enable_tab_bar = true,
	hide_tab_bar_if_only_one_tab = true,
	-- hide_tab_bar_if_only_one_tab = false,
	adjust_window_size_when_changing_font_size = false,
	integrated_title_buttons = { 'Hide', 'Maximize', 'Close' },
	integrated_title_button_alignment = "Right",
	use_fancy_tab_bar = true,
	tab_bar_style = {
		window_hide = "  ",
		window_hide_hover = "  ",
		window_maximize = "  ",
		window_maximize_hover = "  ",
		window_close = "  ",
		window_close_hover = "  ",
	},
	colors = {
		tab_bar = {
			background = color.all_bg,
			active_tab = {
				fg_color = color.active_title_fg:lighten(0.2),
				bg_color = color.active_title_bg:lighten(0.2),
				intensity = "Bold",
				underline = 'None',
				italic = false,
				-- strikethrough = false,
			},
			inactive_tab = {
				bg_color = color.inactive_title_bg:lighten(0.2),
				fg_color = color.inactive_title_fg:lighten(0.2),
				intensity = "Half",
			},
			inactive_tab_hover = {
				bg_color = color.active_title_bg:lighten(0.1),
				fg_color = color.active_title_fg:lighten(0.1),
				italic = false,
			},

			inactive_tab_edge = color.all_bg:lighten(0.1),
			-- inactive_tab_edge = color.all_bg,

			new_tab = {
				bg_color = color.all_bg,
				fg_color = color.all_fg,
			},

			new_tab_hover = {
				bg_color = color.all_bg,
				fg_color = color.all_fg,
				italic = false,
			},
		},
		split = color.all_bg:lighten(0.5)
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
		{ key = "C",     mods = "CTRL",         action = act.ActivateCopyMode },
		{ key = "P",     mods = "CTRL",         action = act.PasteFrom("Clipboard") },
		{ key = "V",     mods = "CTRL",         action = act.PasteFrom("Clipboard") },
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
