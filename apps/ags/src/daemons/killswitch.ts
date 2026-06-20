import Mpris from "gi://AstalMpris";
import Gio from "gi://Gio";
import GLib from "gi://GLib";

const STATE_FILE = `${GLib.get_user_cache_dir()}/spotify-killswitch.json`;

export async function SpotifyKillswitch() {
  let player = getPlayer() ?? (await waitForPlayer());

  while (true) {
    if (!player.can_go_next && !player.can_go_previous) {
      const trackUri = player.get_trackid();
      const position = player.position;

      if (trackUri) saveState(trackUri, position);
      const kill = Gio.Subprocess.new(
        ["pkill", "-x", "spotify"],
        Gio.SubprocessFlags.NONE,
      );
      await kill.wait_async(null);

      Gio.Subprocess.new(["spotify-launcher"], Gio.SubprocessFlags.NONE);

      player = await waitForPlayer();

      const state = loadState();
      if (state) {
        player.open_uri(state.trackUri);
        await waitForPlaybackStatus(player, "Playing");
        player.set_position(state.position);
        clearState();
      }
    } else {
      await sleep(3000);
    }
  }
}

function getPlayer(): Mpris.Player | null {
  return (
    Mpris.get_default()
      .get_players()
      .find((v) => v.identity === "Spotify") ?? null
  );
}

function sleep(ms: number): Promise<void> {
  return new Promise((resolve) => setTimeout(resolve, ms));
}

async function waitForPlayer(): Promise<Mpris.Player> {
  while (true) {
    const player = getPlayer();
    if (player) return player;
    await sleep(1000);
  }
}

function saveState(trackUri: string, position: number) {
  const state = JSON.stringify({ trackUri, position });
  GLib.file_set_contents(STATE_FILE, state);
}

function loadState(): { trackUri: string; position: number } | null {
  try {
    const [ok, contents] = GLib.file_get_contents(STATE_FILE);
    if (!ok) return null;
    return JSON.parse(new TextDecoder().decode(contents));
  } catch {
    return null;
  }
}

function clearState() {
  GLib.unlink(STATE_FILE);
}

async function waitForPlaybackStatus(
  player: Mpris.Player,
  status: string,
): Promise<void> {
  while (player.playback_status !== status) {
    await sleep(200);
  }
}
