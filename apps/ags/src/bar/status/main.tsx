import { createState } from "ags"
import { Astal } from "ags/gtk4"
import { Accessor } from "gnim"
import { With } from "gnim"

import { NetworkConnection, NetworkConnectionPanel } from "./network"
import { BluetoothConnection, BluetoothConnectionPanel } from "./bluetooth"
import { Display, DisplayPanel } from "./display"
import { Power, PowerPanel } from "./power"


export function Status() {
    const [active, setActive] = createState<string | null>(null)
    StatusPanel({ active, setActive })

    return (
        <box spacing={5}>
            <box cssClasses={["bar-component"]} spacing={20}>
                <NetworkConnection active={active} setActive={setActive} />
                <BluetoothConnection active={active} setActive={setActive} />
                <Display active={active} setActive={setActive} />
            </box>
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

            <With value={active}>
                {(v) => {
                    if (v === "network") return <NetworkConnectionPanel />
                    if (v === "bluetooth") return <BluetoothConnectionPanel />
                    if (v === "display") return <DisplayPanel />
                    if (v === "power") return <PowerPanel />
                    return <box />
                }}
            </With>
        </window>
    )
}
