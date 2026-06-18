import battery from "gi://AstalBattery"
import { createBinding, createComputed } from "ags"
import { GetIcon, GetPowerIcon } from "../../assets/icons"

export function Power() {
    const btry = battery.get_default()

    const percentage = createBinding(btry, "percentage")
    const isCharging = createBinding(btry, "charging")

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
