import network from "gi://AstalNetwork"
import { createBinding, createComputed } from "ags"
import { GetWifiIcon } from "../../assets/icons"

export function Wifi() {
    const ntw = network.get_default()
    const wifi = ntw.get_wifi()

    const isConnected = createBinding(wifi, "enabled")
    //const state = createBinding(network, "state")
    const name = createBinding(wifi, "ssid")
    const strength = createBinding(wifi, "strength")

    const tag = createComputed(() => {
        const c = isConnected()
        const n = name()
        const s = strength()

        const icon = GetWifiIcon(c, s)
        if (!c) return icon
        return icon + " " + n
    })

    return (
        <button onClicked={() => {
        }}>
            <label label={tag} />
        </button >
    )
}
