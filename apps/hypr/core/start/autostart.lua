local exc = hl.exec_cmd

hl.on("hyprland.start", function()
    exc("hypridle")
    exc("hyprlock")
    exc("hyprpaper")
    exc("hyprsunsset")

    exc("wl-paste --type text --watch cliphist store")
    exc("wl-paste --type image --watch cliphist store")

    -- temp
    exc("waybar")
    exc("mako")
end)
