import app from "ags/gtk4/app"

import { Bar } from "./bar/bar"

app.start({
    css: "~/dotfiles/apps/ags/src/assets/style.css",
    main() {
        Bar()
    }
})
