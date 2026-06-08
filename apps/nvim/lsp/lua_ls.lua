return {
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
            },
            diagnostics = {
                globals = { "vim", "hl" },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirrdParty = false,
            },
            telemetry = {
                enable = false,
            },
        },
    },
}
