-- cargo install --git https://github.com/wgsl-analyzer/wgsl-analyzer wgsl-analyzer
-- cargo install --git https://github.com/wgsl-analyzer/wgsl-analyzer wgslfmt
--
vim.filetype.add({ extension = { wgsl = "wgsl" } })
vim.lsp.enable("wgsl_analyzer")

vim.lsp.config.wgsl_analyzer = {
    cmd = { "wgsl_analyzer" },
    filetypes = { "wgsl" },
    root_markers = { ".git" },
    settings = {
        wgsl_analyzer = {
            diagnostics = {
                nagaParsingErrors = true,
                nagaValidationErrors = true,
                nagaVersion = "main",
            },
            inlayHints = {
                enabled = true,
                typeHints = true,
                parameterHints = true,
                structLayoutHints = false,
            },
            trace = { server = "off" },
        },
    },
}
