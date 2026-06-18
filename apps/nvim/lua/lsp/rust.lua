vim.lsp.enable("rust_analyzer")

vim.lsp.config.rust_analyzer = {
    root_markers = { "Cargo.toml" },
    settings = {
        rust_analyzer = {
            cargo = { allFeatures = true },
            checkOnSave = true,
            check = { command = "clippy" },
            diagnostics = { enable = true },
            procMacro = { enable = true },
            inlayHints = {
                parameterHintss = { enable = true },
                typeHints = { enable = true },
                chainingHints = { enable = true },
            },
        },
    },
}
