import app from "ags/gtk4/app"

import { Bar } from "./bar/bar"

app.start({
    main() {
        return Bar()
    }
})
