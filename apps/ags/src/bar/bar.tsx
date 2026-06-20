import { Astal } from "ags/gtk4"

import { VolumeDisplay } from "./media/volume"
import { Controls } from "./media/controls"

import { TimeDisplay } from "./time/clock"

import { NetworkStatus } from "./status/wifi"
import { BluetoothStatus } from "./status/bluetooth"
import { DisplayButton } from "./status/display"
import { BrightnessButton } from "./status/brightness"

import { PowerDisplay } from "./status/power"

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
                    <VolumeDisplay />
                    <Controls />
                </box>

                <TimeDisplay $type="center" />

                <box spacing={5} $type="end">
                    <box cssClasses={["bar-component"]} spacing={20}>
                        <NetworkStatus />
                        <BluetoothStatus />
                        <DisplayButton />
                        <BrightnessButton />
                    </box>
                    <PowerDisplay />
                </box>
            </centerbox>
        </window>
    )
}
