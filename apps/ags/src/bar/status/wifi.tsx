import { StatusProp } from "./main"

export function Wifi({ active, setActive }: StatusProp) {

    return (
        <button onClicked={() => {
            setActive(active() === "wifi" ? null : "wifi")
        }}>
            <label label="wifi" />
        </button>
    )
}

export function WifiPanel() {
    return (
        <box>
        </box>
    )
}
