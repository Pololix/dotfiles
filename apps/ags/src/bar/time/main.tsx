import { createPoll } from "ags/time"

export function Time() {
    const time = createPoll("", 1000, "date +%H:%M")

    return (
        <box cssClasses={["bar-component"]}>
            <label label={time} />
        </box>
    )
}
