import { StatusProp } from "./main"

export function QuickSettings({ active, setActive }: StatusProp) {
    return (
        <box cssClasses={["bar-component"]} spacing={20}>
            <button onClicked={() => {
                setActive(active() === "wifi" ? null : "wifi")
            }}>
                <label label="wifi" />
            </button>

            <button onClicked={() => {
                setActive(active() === "bluetooth" ? null : "bluetooth")
            }}>
                <label label="bluetooth" />
            </button>

            <button onClicked={() => {
                setActive(active() === "brightness" ? null : "brightness")
            }}>
                <label label="brightness" />
            </button>
        </box>
    )
}

