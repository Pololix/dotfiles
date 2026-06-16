export function GetIcon(name: string) {
  // media
  if (name === "volume") return "";
  if (name === "mute") return "";

  if (name === "prev") return "󰒮";
  if (name === "play") return "󰐎";
  if (name === "next") return "󰒭";

  // time

  // status
  if (name === "wifi-disconnected") return "󰒭";
  if (name === "bluetooth-disconnected") return "󰂲";
  if (name === "bluetooth") return "󰂯";

  if (name === "charging") return "󱐋";
}

export function GetWifiIcon(isConnected: boolean, strength: number) {
  if (!isConnected) return "󰤮";
  if (strength < 0.2) return "󰤯";
  if (strength < 0.4) return "󰤟";
  if (strength < 0.6) return "󰤢";
  if (strength < 0.8) return "󰤥";
  return "󰤨";
}

export function GetDeviceIcon(type: string) {
  if (type.includes("headset")) return "󰋋";
  if (type.includes("mouse")) return "󰍽";
  return "󰟢";
}

export function GetPowerIcon(percentage: number) {
  if (percentage < 10) return "󰂃";
  if (percentage < 20) return "󰁻";
  if (percentage < 40) return "󰁽";
  if (percentage < 60) return "󰁿";
  if (percentage < 80) return "󰂁";
  return "󰁹";
}
