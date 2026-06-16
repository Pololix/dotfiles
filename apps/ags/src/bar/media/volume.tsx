import Wp from "gi://AstalWp"
import { createBinding, createComputed } from "ags"

export function Volume() {
    const device = Wp.get_default().get_default_speaker()

    const percentage = createBinding(device, "volume")
    const isMuted = createBinding(device, "mute")

    const tag = createComputed(() => {
        const m = isMuted()

        if (m) return ""

        const p = percentage()
        if (p === 0) return "" + " " + Math.round(p * 100) + "%"
        return "" + " " + Math.round(p * 100) + "%"
    })

    return (
        <label cssClasses={["bar-component"]} label={tag} />
    )
}
