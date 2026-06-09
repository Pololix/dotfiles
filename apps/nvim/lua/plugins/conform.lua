local conform = {
    "stevearc/conform.nvim",

    config = function()
        require("conform").setup({
            fomatters_by_ft = {
                lua = { "stylua " },
                rust = { "rustfmt" },
                gdscript = { "gdformat" },
            },
            format_on_save = true,
        })

        local o = { noremap = true, silent = true }
        local mappings = {
            {
                "n",
                "fa",
                function()
                    require("conform").format({ async = true, lsp_fallback = true })
                end,
                o,
            },
        }

        for _, k in ipairs(mappings) do
            vim.keymap.set(k[1], k[2], k[3], k[4])
        end
    end,
}

return conform
