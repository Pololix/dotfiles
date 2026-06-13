import { createPoll } from "ags/time"

export function Clock() {
    const time = createPoll("", 1000, "date +%H:%M")

    return <label label={time} />
}
