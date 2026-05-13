local M = {
    "hyprlock -c ~/.config/hypr/plugins/hyprlock.conf",
    "hypridle",
    "waybar",
    "mako",
    "nm-applet",
    "blueman-applet",
    "wl-paste --type text --watch cliphist store",
    "wl-paste --type image --watch cliphist store",
}

hl.on("hyprland.start", function()
    for _, cmd in pairs(M) do
        hl.exec_cmd(cmd)
    end
end)
