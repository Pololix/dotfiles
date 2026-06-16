import mpris from "gi://AstalMpris"
import { createState, createComputed } from "ags"
import { GetIcon } from "../../assets/icons"

export function Controls() {
    const mprs = mpris.get_default()
    const [players, setPlayers] = createState(mprs.get_players())

    mprs.connect("items-changed", () => {
        setPlayers(mprs.get_players)
    })

    const player = createComputed(() => players()[0])

    return (
        <box cssClasses={["bar-component"]} spacing={20}>
            <button onClicked={() => {
                if (player() === undefined) return
                player().previous()
            }}>
                <label label={GetIcon("prev")} />
            </button>

            <button onClicked={() => {
                if (player() === undefined) return
                player().play_pause()
            }}>
                <label label={GetIcon("play")} />
            </button>

            <button onClicked={() => {
                if (player() === undefined) return
                player().next()
            }}>
                <label label={GetIcon("next")} />
            </button>
        </box>
    )
}
