local exec = hl.dsp.exec_cmd
local window = hl.dsp.window
local workspace = hl.dsp.workspace
local focus = hl.dsp.focus

local mod = "SUPER"

local LMB = "mouse:272"
local RMB = "mouse:273"
local MMB = "mouse:274"

-- mods: SUPER, SHIFT, CTRL, ALT
-- special keys: Escape, Tab, Space, Return (Enter), Backspace

local M = {
    -- Quick apps
    [mod .. " + Return"] = exec("kitty"),
    [mod .. " + Space"] = exec("fuzzel"),

    -- Window nav
    [mod .. " + h"] = focus({ direction = "l" }),
    [mod .. " + j"] = focus({ direction = "d" }),
    [mod .. " + k"] = focus({ direction = "u" }),
    [mod .. " + l"] = focus({ direction = "r" }),

    [mod .. " + SHIFT + h"] = window.move({ direction = "l" }),
    [mod .. " + SHIFT + j"] = window.move({ direction = "d" }),
    [mod .. " + SHIFT + k"] = window.move({ direction = "u" }),
    [mod .. " + SHIFT + l"] = window.move({ direction = "r" }),

    [mod .. " + q"] = window.kill(), -- fix: kill all open windows of the same process, kill onnly active window
    [mod .. " + f"] = window.fullscreen(),

    [mod .. " + " .. LMB] = window.drag(),
    [mod .. " + " .. RMB] = window.resize(),
    [mod .. " + " .. MMB] = window.float(),

    -- Special workspaces
    [mod .. " + Escape"] = workspace.toggle_special("trash"),
    [mod .. " + SHIFT + Escape"] = window.move({ workspace = "special:trash", follow = false }),
    [mod .. " + Backspace"] = workspace.toggle_special("spotify"),
    [mod .. " + SHIFT + Backspace"] = window.move({ workspace = "special:spotify", follow = false }),

    ["ALT + Tab"] = function()
        local active = hl.get_active_window()
        local fullscreen = active ~= nil and active.fullscreen ~= 0
        if fullscreen then
            hl.dispatch(window.fullscreen())
            hl.dispatch(window.cycle_next())
            hl.dispatch(window.fullscreen())
        else
            hl.dispatch(window.cycle_next())
        end
    end,

    -- Brightness
    ["XF86MonBrightnessUp"] = exec("brightnessctl set 5%+"),
    [mod .. " + XF86MonBrightnessUp"] = exec("brightnessctl set 100%"),
    ["XF86MonBrightnessDown"] = exec("brightnessctl set 5%-"),
    [mod .. " + XF86MonBrightnessDown"] = exec("brightnessctl set 1"),

    -- Audio
    ["XF86AudioRaiseVolume"] = exec("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"),
    [mod .. " + XF86AudioRaiseVolume"] = exec("wpctl set-volume @DEFAULT_AUDIO_SINK@ 100%"),
    ["XF86AudioLowerVolume"] = exec("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
    [mod .. " + XF86AudioLowerVolume"] = exec("wpctl set-volume @DEFAULT_AUDIO_SINK@ 0%"),
    ["XF86AudioMute"] = exec("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
    ["XF86AudioPlay"] = exec("playerctl play-pause"),
    [mod .. " + XF86AudioPlay"] = exec("playerctl next"),

    -- Screenshots
    ["SUPER + SHIFT + s"] = exec("bash ~/dotfiles/scripts/screenshot.sh region"),
}

for key, action in pairs(M) do
    hl.bind(key, action)
end

-- Workspaces
for i = 1, 9 do
    hl.bind(mod .. " + " .. i, focus({ workspace = i }))
    hl.bind(mod .. " + SHIFT + " .. i, window.move({ workspace = i }))
end
