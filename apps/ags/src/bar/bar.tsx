import { Astal } from "ags/gtk4"

//import { Media } from "./media"
import { Clock } from "./clock"
//import { Media } from "./status"

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
            </centerbox>
        </window>
    )
}
