local exc = hl.dsp.exec_cmd
local win = hl.dsp.window

local mod = "SUPER"

local LMB = ":mouse272"
local RMB = ":mouse273"
local MMB = ":mouse274"

local M = {
    -- Quick apps
    [mod .. " + Return"] = exc("kitty"),
    [mod .. " + Space"] = exc("fuzzel"),
    [mod .. " + Escape"] = exc("hyprlock"),

    -- Window nav
    [mod .. " + h"] = hl.dsp.focus({ direction = "l" }),
    [mod .. " + j"] = hl.dsp.focus({ direction = "d" }),
    [mod .. " + k"] = hl.dsp.focus({ direction = "u" }),
    [mod .. " + l"] = hl.dsp.focus({ direction = "r" }),

    [mod .. " + q"] = win.kill(),
    [mod .. " + f"] = win.fullscreen(),

    -- System
    ["XF86MonBrightnessUp"] = exc("brightnessctl set 5%+"),
    ["XF86MonBrightnessDown"] = exc("brightnessctl set 5%-"),

    ["XF86AudioRaiseVolume"] = exc("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"),
    ["XF86AudioLowerVolume"] = exc("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
    ["XF86AudioMute"] = exc("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),

    -- Screenshots
    ["SUPER + SHIFT + s"] = exc("bash ~/dotfiles/scripts/screenshot-region.sh"),

    -- Clipboard
    ["CONTROL + SHIFT + v"] = exc("bash ~/dotfiles/scripts/pick.sh"),
}

for key, action in pairs(M) do
    hl.bind(key, action)
end
