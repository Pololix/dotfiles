import wp from "gi://AstalWp"
import { createBinding, createComputed } from "ags"
import { GetIcon } from "../../assets/icons"

export function Volume() {
    const device = wp.get_default().get_default_speaker()

    const percentage = createBinding(device, "volume")
    const isMuted = createBinding(device, "mute")

    const tag = createComputed(() => {
        const m = isMuted()

        if (m) return GetIcon("mute")

        const p = Math.round(percentage() * 100)
        if (p === 0) return GetIcon("mute") + " " + p + "%"
        return GetIcon("volume") + " " + p + "%"
    })

    return (
        <button cssClasses={["bar-component"]} onClicked={() => {

        }}>
            <label label={tag} />
        </button >
    )
}
