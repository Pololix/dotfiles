import { GetIcon } from "../../assets/icons"

export function Display() {
    return (
        <button onClicked={() => {
        }}>
            <label label={GetIcon("display")} />
        </button >
    )
}
