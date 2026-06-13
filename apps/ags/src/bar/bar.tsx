import { Astal } from "ags/gtk4"
import { Clock } from "./clock"

export function Bar() {
    const { TOP, LEFT, RIGHT } = Astal.WindowAnchor
    return (
        <window
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
