return {
    settings = {
        ["rust_analyzer"] = {
            cargo = {
                allFeatures = true,
            },
            diagnostics = {
                enable = true,
            },
            check = {
                command = "clippy",
            },
            inlayHints = {
                typeHints = true,
                parameterHints = true,
            },
        },
    },
}
