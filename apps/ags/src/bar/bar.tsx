import { Astal } from "ags/gtk4"

import { Volume } from "./media/volume"
import { Controls } from "./media/controls"
import { Clock } from "./time/clock"
import { Wifi } from "./status/network"
import { Bluetooth } from "./status/bluetooth"
import { Display } from "./status/display"
import { Power } from "./status/power"

export function Bar() {
    const { TOP, LEFT, RIGHT } = Astal.WindowAnchor

    return (
        <window
            cssClasses={["bar"]}
            visible
            anchor={TOP | LEFT | RIGHT}
            exclusivity={Astal.Exclusivity.EXCLUSIVE}
        >
            <centerbox>
                <box spacing={5} $type="start">
                    <Volume />
                    <Controls />
                </box>

                <Clock $type="center" />

                <box spacing={5} $type="end">
                    <box cssClasses={["bar-component"]} spacing={20}>
                        <Wifi />
                        <Bluetooth />
                        <Display />
                    </box>
                    <Power />
                </box>
            </centerbox>
        </window>
    )
}
