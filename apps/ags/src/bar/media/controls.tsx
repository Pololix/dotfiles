import Mpris from "gi://AstalMpris"
import { createState, createComputed } from "ags"
import { GetIcon } from "../../assets/icons"

export function Controls() {
    const mpris = Mpris.get_default()
    const [players, setPlayers] = createState(mpris.get_players())

    mpris.connect("items-changed", () => {
        setPlayers(mpris.get_players())
    })

    const player = createComputed(() => players()[0])
    const title = createComputed(() => {
        if (player() === undefined) return ""
        return player().title
    })

    return (
        <box
            cssClasses={["bar-component"]}
            spacing={20}
            visible={player((v) => v !== undefined)}
        >
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
            <label label={title} />
        </box>
    )
}
