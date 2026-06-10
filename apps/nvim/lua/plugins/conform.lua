local o = { noremap = true, silent = true }
local map = vim.keymap.set

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

        map("n", "fa", function()
            require("conform").format({ async = true, lsp_fallback = true })
        end, o)
    end,
}

return conform
