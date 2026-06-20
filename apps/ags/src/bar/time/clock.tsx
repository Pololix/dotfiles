import { createPoll } from "ags/time"

export function TimeDisplay() {
    const time = createPoll("", 1000, "date +%H:%M")

    return (
        <button cssClasses={["bar-component"]} onClicked={() => {
        }}>
            <label label={time} />
        </button >
    )
}
