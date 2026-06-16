import { GetIcon } from "../../assets/icons"

export function Controls() {
    return (
        <box cssClasses={["bar-component"]} spacing={20}>
            <button onClicked={() => {
            }}>
                <label label={GetIcon("prev")} />
            </button>

            <button onClicked={() => {
            }}>
                <label label={GetIcon("play")} />
            </button>

            <button onClicked={() => {
            }}>
                <label label={GetIcon("next")} />
            </button>
        </box>
    )
}
