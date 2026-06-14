import { StatusProp } from "./main"

export function Power({ active, setActive }: StatusProp) {
    return (
        <button cssClasses={["bar-component"]} onClicked={() => {
            setActive(active() === "power" ? null : "power")
        }}>
            <label label="Power" />
        </button>
    )
}
