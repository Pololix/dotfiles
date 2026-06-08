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
            }
        })
    end,
}

return { autopairs, toggleterm }
