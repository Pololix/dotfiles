local autopairs = {
    "windwp/nvim-autopairs",

    config = function()
        require("nvim-autopairs").setup({
            check_ts = true,
        })
    end,
}

local toggleterm = {
    "akinsho/toggleterm.nvim",
    config = function()
        require("toggleterm").setup({
            direction = "float",
            float_opts = {
                border = "rounded",
            },
        })

        local o = { noremap = true, silent = true }
        local mappings = {
            { "n", "<leader>t", "<cmd>ToggleTerm<CR>", o },
            { "t", "<esc>", "<cmd>q!<CR>", o },
        }

        for _, k in ipairs(mappings) do
            vim.keymap.set(k[1], k[2], k[3], k[4])
        end
    end,
}

return { autopairs, toggleterm }
