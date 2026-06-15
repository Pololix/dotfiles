import { StatusProp } from "./main"

export function Display({ active, setActive }: StatusProp) {

    return (
        <button onClicked={() => {
            setActive(active() === "display" ? null : "display")
        }}>
            <label label="display" />
        </button>
    )
}

export function DisplayPanel() {
    return (
        <box>
        </box>
    )
}
