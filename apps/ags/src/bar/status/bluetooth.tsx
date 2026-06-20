import Bluetooth from "gi://AstalBluetooth"
import { createBinding, createComputed } from "ags"
import { GetIcon, GetDeviceIcon, GetPowerIcon } from "../../assets/icons"

export function BluetoothStatus() {
    const bluetooth = Bluetooth.get_default()

    const devices = createBinding(bluetooth, "devices")
    const isPowered = createBinding(bluetooth, "is_powered")
    const isConnected = createBinding(bluetooth, "is_connected")

    const tag = createComputed(() => {
        const p = isPowered()

        if (!p) return GetIcon("bluetooth-disconnected")

        const c = isConnected()
        const ds = devices()
        const d = ds.find((v) => v.connected)

        if (!d || !c) return GetIcon("bluetooth")

        const n = d.name
        const b = Math.round(d.battery_percentage * 100)
        const icon = GetDeviceIcon(d.icon)
        const bat_icon = GetPowerIcon(b)
        return icon + " " + n + " " + bat_icon
    })

    return (
        <button onClicked={() => {
        }}>
            <label label={tag} />
        </button >
    )
}
