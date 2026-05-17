local conform = require("conform")
local lint = require("lint")

local M = {
    { -- start treesitter
        events = { "FileType" },
        opts = {
            pattern = { "<filetype>" },
            callback = function()
                vim.treesitter.start()
            end,
        },
    },

    { -- remove signcolumn in neotree buffer
        events = { "BufWinEnter", "WinEnter" },
        opts = {
            callback = function()
                if vim.bo.filetype == "neo-tree" then
                    vim.wo.foldcolumn = "0"
                end
            end,
        },
    },

    { -- format before saving
        events = { "BufWritePre" },
        opts = {
            pattern = "*",
            callback = function(args)
                conform.format({ bufnr = args.buf })
            end,
        },
    },

    { -- start linter
        events = { "BufWritePost", "InsertLeave" },
        opts = {
            group = vim.api.nvim_create_augroup("nvim-lint", { clear = true }),
            callback = function()
                if lint.linters_by_ft[vim.bo.filetype] then
                    lint.try_lint()
                end
            end,
        },
    },
}

for _, autocmd in ipairs(M) do
    vim.api.nvim_create_autocmd(autocmd.events, autocmd.opts)
end
