import { GetIcon } from "../../assets/icons"

export function BrightnessButton() {
    return (
        <button onClicked={() => {
        }}>
            <label label={GetIcon("brightness")} />
        </button >
    )
}
