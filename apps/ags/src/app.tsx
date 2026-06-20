import app from "ags/gtk4/app"

import { Bar } from "./bar/bar"
import { SpotifyKillswitch } from "./daemons/killswitch"

app.start({
    css: "/home/Pablo/dotfiles/apps/ags/src/style.css",
    main() {
        SpotifyKillswitch()
        Bar()
    }
})
