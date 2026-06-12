vim.lsp.enable("ts_ls")

vim.lsp.config.ts_ls = {
    root_markers = { "tsconfig.json" },
    settings = {
        tsserver = {
            jsx = "react",
            target = "ES2022",
            diagnostics = {
                enable = true,
            },
            telemetry = {
                enable = false,
            },
            workspace = {
                preferUserConfig = true,
            },
            completions = {
                completeFunctionCalls = true,
            },
            inlayHints = {
                parameterNames = { enabled = "all" },
                variableTypes = { enabled = true },
            },
        },
    },
}
