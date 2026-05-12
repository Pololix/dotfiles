local exec = hl.exec_cmd

hl.on("hyprland.start", function()
    exec("hyprlock --immediate")
    exec("hypridle")
    exec("waybar")
    exec("mako")
    exec("nm-applet")
    exec("blueman-applet")
    exec("wl-paste --type text --watch cliphist store")
    exec("wl-paste --type image --watch cliphist store")
end)
