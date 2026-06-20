import { GetIcon } from "../../assets/icons"

export function DisplayButton() {
    return (
        <button onClicked={() => {
        }}>
            <label label={GetIcon("display")} />
        </button >
    )
}
