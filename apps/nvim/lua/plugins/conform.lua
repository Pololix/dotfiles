local o = { noremap = true, silent = true }
local map = vim.keymap.set

local conform = {
    "stevearc/conform.nvim",
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                lua = { "stylua" },
                typescript = { "prettier" },

                json = { "prettier" },
                toml = { "taplo" },
            },
            format_on_save = {
                timeout_ms = 500,
                lsp_fallback = true,
            },
        })

        map("n", "fa", function()
            require("conform").format({ async = true, lsp_fallback = true })
        end, o)
    end,
}

return conform
