local wezterm = require("wezterm")
local cp = {}

local function is_win()
    if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
        return true
    else
        return false
    end
end

local function is_mac()
    if wezterm.target_triple == 'x86_64-apple-darwin' or wezterm.target_triple == 'aarch64-apple-darwin' then
        return true
    else
        return false
    end
end


local function get_font_size()
    local font_size
    if is_win() then
        font_size = 13
    end

    if is_mac() then
        font_size = 17
    end
    return font_size
end



local function get_default_prog()
    local default_prog = {}
    if is_win() then
        default_prog = { 'pwsh', '--nologo' }
    end

    if is_mac() then
        default_prog = { '/bin/zsh', '-l' }
    end
    return default_prog
end


local function get_default_launch()
    local default_launch = {}
    if is_win() then
        default_launch = {
            { label = "Powershell", args = { "pwsh", "-nol", "-noe" }, },
            { label = "WSL",        args = { "wsl", "-d", "Ubuntu", "--cd", "~" }, },
            -- { label = "Nushell",    args = { "nu" }, },
        }
    end
    if is_mac() then
        default_launch = {
            { label = "Zsh",     args = { "/bin/zsh", "-l" }, },
            -- { label = "Nushell", args = { "/opt/homebrew/bin/nu" }, },
        }
    end
    return default_launch
end

local function get_default_window_decorations()
    local default_window_decorations = ""
    if is_win() then
        default_window_decorations = "INTEGRATED_BUTTONS | RESIZE"
        -- default_window_decorations = "RESIZE"
    end
    if is_mac() then
        default_window_decorations = " MACOS_FORCE_DISABLE_SHADOW | RESIZE"
    end
    return default_window_decorations
end


local function get_special_settings()
    local special_settings = {}
    if is_win() then
        special_settings = {
            window_background_opacity = 0.9,
            -- win32_system_backdrop = 'Tabbed',
            -- win32_system_backdrop = 'Acrylic',
            win32_system_backdrop = 'Mica'

        }
    end

    if is_mac() then
        special_settings = {
            window_background_opacity = 0.5,
            macos_window_background_blur = 80,
        }
    end
    return special_settings
end

cp.font_size = get_font_size()
cp.default_prog = get_default_prog()
cp.default_launch = get_default_launch()
cp.default_window_decorations = get_default_window_decorations()
cp.special_settings = get_special_settings()

return cp
