vim.lsp.enable("ts_ls")

vim.lsp.config.ts_ls = {
    settings = {
        tsserver = {
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
