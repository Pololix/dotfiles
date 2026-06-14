import { createState } from "ags"
import { Astal } from "ags/gtk4"
import { Accessor } from "gnim"

export function Status() {
    const [active, setActive] = createState<string | null>(null)
    Panel({ active, setActive })

    return (
        <box spacing={5}>
            <QuickSettings active={active} setActive={setActive} />
            <Brightness active={active} setActive={setActive} />
            <Power active={active} setActive={setActive} />
        </box>
    )
}

type StatusProp = {
    active: Accessor<string | null>
    setActive: (v: string | null) => void
}

function Panel({ active, setActive }: StatusProp) {
    const { TOP, RIGHT } = Astal.WindowAnchor
    return (
        <window
            cssClasses={["bar-panel"]}
            visible={active((v) => v !== null)}
            anchor={TOP | RIGHT}
            widthRequest={400}
            heightRequest={300}
        >
            <label label="panel" />
        </window>
    )
}

function QuickSettings({ active, setActive }: StatusProp) {
    return (
        <button cssClasses={["bar-component"]} onClicked={() => {
            setActive(active() === "quick-settings" ? null : "quick-settings")
        }}>
            <label label="QuickSettings" />
        </button>
    )
}

function Brightness({ active, setActive }: StatusProp) {
    return (
        <button cssClasses={["bar-component"]} onClicked={() => {
            setActive(active() === "brightness" ? null : "brightness")
        }}>
            <label label="Brightness" />
        </button>
    )
}

function Power({ active, setActive }: StatusProp) {
    return (
        <button cssClasses={["bar-component"]} onClicked={() => {
            setActive(active() === "power" ? null : "power")
        }}>
            <label label="Power" />
        </button>
    )
}
