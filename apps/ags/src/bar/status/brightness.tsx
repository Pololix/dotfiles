import { GetIcon } from "../../assets/icons"

export function Brightness() {
    return (
        <button onClicked={() => {
        }}>
            <label label={GetIcon("brightness")} />
        </button >
    )
}
