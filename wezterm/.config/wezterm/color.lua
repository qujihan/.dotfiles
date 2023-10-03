local wezterm = require 'wezterm'

local color_default_fg_light = wezterm.color.parse("#cacaca")
local color_default_fg_dark = wezterm.color.parse("#303030")
local colors = {
    PAYNE = {
        bg = wezterm.color.parse("#385F71"),
        fg = color_default_fg_light
    },
    INDIGO = {
        bg = wezterm.color.parse("#7C77B9"),
        fg = color_default_fg_light
    },
    JET = {
        bg = wezterm.color.parse("#282B28"),
        fg = color_default_fg_light
    },
    TAUPE = {
        bg = wezterm.color.parse("#785964"),
        fg = color_default_fg_light
    },
    ECRU = {
        bg = wezterm.color.parse("#C6AE82"),
        fg = color_default_fg_dark
    },
    VIOLET = {
        bg = wezterm.color.parse("#685F74"),
        fg = color_default_fg_light
    },
    BLACK = {
        bg = wezterm.color.parse("#080808"),
        fg = color_default_fg_light
    },
}

local color = (function()
    local iterator = {
        -- colors.PAYNE,
        -- colors.INDIGO,
        -- colors.JET,
        -- colors.TAUPE,
        -- colors.ECRU,
        -- colors.VIOLET,
        colors.BLACK
    }
    return iterator[math.random(#iterator)]
end)()



local foreground_color, background_color = color.fg, color.bg
local all_fg, all_bg = foreground_color:darken(0.3), background_color:darken(0.3)
local active_title_fg, active_title_bg = foreground_color:lighten(0.3), background_color:lighten(0.3)
local inactive_title_fg, inactive_title_bg = foreground_color, background_color

M = {
    all_fg = all_fg,
    all_bg = all_bg,
    active_title_fg = active_title_fg,
    active_title_bg = active_title_bg,
    inactive_title_fg = inactive_title_fg,
    inactive_title_bg = inactive_title_bg,
}


return M
