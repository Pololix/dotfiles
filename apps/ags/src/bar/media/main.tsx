import { Volume } from "./volume"
import { Controls } from "./controls"

export function Media() {
    return (
        <box spacing={5}>
            <Volume />
            <Controls />
        </box>
    )
}
