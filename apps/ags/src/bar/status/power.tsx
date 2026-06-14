import Battery from "gi://AstalBattery"
import { createBinding } from "ags"
import { StatusProp } from "./main"

export function Power({ active, setActive }: StatusProp) {
    const battery = Battery.get_default()
    const percentage = createBinding(battery, "percentage")
    const isCharging = createBinding(battery, "charging")

    return (
        <button cssClasses={["bar-component"]} onClicked={() => {
            setActive(active() === "power" ? null : "power")
        }}>
            <label label={percentage((v) => {
                const icon = GetIcon(v, isCharging())
                const num = Math.round(v * 100)

                return icon + " " + num + "%"
            })} />
        </button>
    )
}

function GetIcon(percentage: number, isCharging: boolean) {
    if (isCharging) return "󱐋"
    if (percentage < 0.1) return "󰁺"
    if (percentage < 0.2) return "󰁻"
    if (percentage < 0.4) return "󰁽"
    if (percentage < 0.6) return "󰁿"
    if (percentage < 0.8) return "󰂁"
    return "󰁹"
}
