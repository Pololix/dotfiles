return {
    { -- autopairs
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup({
                check_ts = true
            })
        end
    },

    { -- toggleterm
        "akinsho/toggleterm.nvim",
        config = function()
            require("toggleterm").setup()
        end
    },
}
