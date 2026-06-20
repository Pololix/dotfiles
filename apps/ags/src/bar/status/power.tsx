import Battery from "gi://AstalBattery"
import { createBinding, createComputed } from "ags"
import { GetIcon, GetPowerIcon } from "../../assets/icons"

export function PowerDisplay() {
    const battery = Battery.get_default()

    const percentage = createBinding(battery, "percentage")
    const isCharging = createBinding(battery, "charging")

    const tag = createComputed(() => {
        const p = Math.round(percentage() * 100)
        const c = isCharging()

        if (c) return GetIcon("charging") + " " + p + "%"
        return GetPowerIcon(p) + " " + p + "%"
    })

    return (
        <button cssClasses={["bar-component"]} onClicked={() => {
        }}>
            <label label={tag} />
        </button >
    )
}
