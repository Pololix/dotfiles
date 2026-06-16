import Bluetooth from "gi://AstalBluetooth"
import { createBinding, createComputed } from "ags"
import { StatusProp } from "./main"

export function BluetoothConnection({ active, setActive }: StatusProp) {
    const bluetooth = Bluetooth.get_default()

    const devices = createBinding(bluetooth, "devices")
    const isPowered = createBinding(bluetooth, "is_powered")
    const isConnected = createBinding(bluetooth, "is_connected")

    const tag = createComputed(() => {
        const p = isPowered()

        if (!p) return "󰂲"

        const c = isConnected()
        const ds = devices()
        const d = ds.find((v) => v.connected)

        if (!d || !c) return "󰂯"

        const n = d.name
        const b = d.battery_percentage
        const icon = GetDeviceIcon(d.icon)
        const bat_icon = GetBatteryIcon(b)
        return icon + " " + n + " " + bat_icon
    })

    return (
        <button onClicked={() => {
            setActive(active() === "bluetooth" ? null : "bluetooth")
        }}>
            <label label={tag} />
        </button>
    )
}

function GetDeviceIcon(type: string) {
    if (type.includes("headset")) return "󰋋"
    if (type.includes("mouse")) return "󰍽"
    return "󰟢"
}

function GetBatteryIcon(percentage: number) {
    if (percentage < 0.1) return "󰂃"
    if (percentage < 0.2) return "󰁻"
    if (percentage < 0.4) return "󰁽"
    if (percentage < 0.6) return "󰁿"
    if (percentage < 0.8) return "󰂁"
    return "󰁹"
}

export function BluetoothConnectionPanel() {
    return (
        <box>
        </box>
    )
}
