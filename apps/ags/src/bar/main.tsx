import { Astal } from "ags/gtk4"

import { Media } from "./media/main"
import { Time } from "./time/main"
import { Notifications } from "./notifications/main"
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
                <Media $type="start" />
                <box $type="center" spacing={5}>
                    <Time />
                    <Notifications />
                </box>
                <Status $type="end" />
            </centerbox>
        </window>
    )
}
