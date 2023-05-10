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
        font_size = 15
    end
    return font_size
end




local function get_default_prog()
    local default_prog = {}
    if is_win() then
        default_prog = { 'pwsh','--nologo'}
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
            { label = "Powershell",    args = { "pwsh.exe", "-nol", "-noe" }, },
        }
    end
    if is_mac() then
        default_launch = {
            { label = "Zsh",    args = { "/bin/zsh", "-l" }, },
        }
    end
    return default_launch
end


cp.font_size = get_font_size()
cp.default_prog = get_default_prog()
cp.default_launch = get_default_launch()

return cp
