local M = {}

function M.setup()
    require("conform").setup({

        formatters_by_ft = {
            lua = { "stylua" },
        },

        format_on_save = function()
            return { timeout_ms = 500, lsp_fallback = true }
        end,
    })
end

return M
