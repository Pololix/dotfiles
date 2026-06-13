import app from "ags/gtk4/app"
import Wp from "gi://AstalWp"
import { Astal } from "ags/gtk4"
import { createPoll } from "ags/time"
import { createBinding } from "ags"

app.start({
    main() {
        return Bar()
    }
})

function Bar() {
    const { TOP, LEFT, RIGHT } = Astal.WindowAnchor

    return (
        <window
            visible
            anchor={TOP | LEFT | RIGHT}
            exclusivity={Astal.Exclusivity.EXCLUSIVE}
        >
            <centerbox>
                <box $type="start">
                    <Volume />
                </box>
                <Clock $type="center" />
                <label label="right" $type="end" />
            </centerbox>
        </window>
    )
}

// Media
function Volume() {
    const speaker = Wp.get_default().get_default_speaker()
    const volume = createBinding(speaker, "volume")
    console.log("raw volume:", speaker.volume)
    console.log("wp:", Wp.get_default())
    console.log("speaker:", Wp.get_default().get_default_speaker())
    return <label label={volume((v) => Math.round(v * 100) + "%")} />
}

// Time
function Clock() {
    const time = createPoll("", 1000, "date +%H:%M")
    return <label label={time} />
}

// Status bar
