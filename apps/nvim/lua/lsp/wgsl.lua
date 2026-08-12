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

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.wgsl",
    callback = function(args)
        if vim.fn.executable("wgslfmt") == 1 then
            vim.cmd(string.format("silent! !wgslfmt %s", vim.fn.shellescape(args.file)))
            vim.cmd("silent! edit!")
        end
    end,
})
