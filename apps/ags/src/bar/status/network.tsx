import Network from "gi://AstalNetwork"
import { createBinding, createComputed } from "ags"
import { StatusProp } from "./main"

export function NetworkConnection({ active, setActive }: StatusProp) {
    const wifi = Network.get_default().get_wifi()

    const isConnected = createBinding(wifi, "enabled")
    //const state = createBinding(network, "state")
    const name = createBinding(wifi, "ssid")
    const strength = createBinding(wifi, "strength")

    const tag = createComputed(() => {
        const c = isConnected()
        const n = name()
        const s = strength()

        const icon = GetIcon(s, c)
        if (!c) return icon
        return icon + " " + n
    })

    return (
        <button onClicked={() => {
            setActive(active() === "network" ? null : "network")
        }}>
            <label label={tag} />
        </button>
    )
}

function GetIcon(strength: number, isConnected: boolean) {
    if (!isConnected) return "󰤮"
    if (strength < 0.2) return "󰤯"
    if (strength < 0.4) return "󰤟"
    if (strength < 0.6) return "󰤢"
    if (strength < 0.8) return "󰤥"
    return "󰤨"
}

export function NetworkConnectionPanel() {
    return (
        <box>
        </box>
    )
}
