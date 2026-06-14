import { Astal } from "ags/gtk4"

//import { Media } from "./media/main"
import { Clock } from "./time/main"
import { Status } from "./status/main"

export function Bar() {
    const { TOP, LEFT, RIGHT } = Astal.WindowAnchor

    return (
        <window
            cssClasses={["bar"]}
            visible
            anchor={TOP | LEFT | RIGHT}
            exclusivity={Astal.Exclusivity.EXCLUSIVE}
        >
            <centerbox>
                <Clock $type="center" />
                <Status $type="end" />
            </centerbox>
        </window>
    )
}
