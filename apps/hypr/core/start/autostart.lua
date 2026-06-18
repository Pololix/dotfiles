local exec = hl.exec_cmd

hl.on("hyprland.start", function()
    exec("hypridle")
    exec("hyprlock")
    exec("hyprpaper")
    exec("hyprsunsset")

    exec("wl-paste --type text --watch cliphist store")
    exec("wl-paste --type image --watch cliphist store")

    exec("ags run ~/dotfiles/apps/ags/src/app.tsx")
    exec("[workspace special:spotify silent] spotify-launcher")
end)
