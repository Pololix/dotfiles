import { StatusProp } from "./main"

export function Bluetooth({ active, setActive }: StatusProp) {

    return (
        <button onClicked={() => {
            setActive(active() === "bluetooth" ? null : "bluetooth")
        }}>
            <label label="bluetooth" />
        </button>
    )
}

export function BluetoothPanel() {
    return (
        <box>
        </box>
    )
}
