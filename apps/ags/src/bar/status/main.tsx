import { createState } from "ags"
import { Astal } from "ags/gtk4"
import { Accessor } from "gnim"

import { Power } from "./power"
import { QuickSettings } from "./quick-settings"

export function Status() {
    const [active, setActive] = createState<string | null>(null)
    StatusPanel({ active, setActive })

    return (
        <box spacing={5}>
            <QuickSettings active={active} setActive={setActive} />
            <Power active={active} setActive={setActive} />
        </box>
    )
}

export type StatusProp = {
    active: Accessor<string | null>
    setActive: (v: string | null) => void
}

function StatusPanel({ active, setActive }: StatusProp) {
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
