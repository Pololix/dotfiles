vim.lsp.enable("svelte")

vim.lsp.config.svelte = {
    root_markers = { "svelte.config.js", "package.json" },
    settings = {
        svelte = {
            plugin = {
                typescript = { enable = true },
            },
        },
    },
}
