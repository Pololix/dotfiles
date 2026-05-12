local exc = hl.dsp.exec_cmd

local mod = "SUPER"

local M = {
    [mod .. " + Return"] = hl.dsp.exec_cmd("kitty"),
    [mod .. " + Space"]  = hl.dsp.exec_cmd("rofi -show drun"),
}

for key, action in pairs(M) do
    hl.bind(key, action)
end
