return {
    {
        "Pololix/greyshift-nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("greyshift").setup()
            vim.cmd.colorscheme("greyshift")
        end
    },

    {
        "nvim-tree/nvim-web-devicons",
        config = function()
            require("nvim-web-devicons").setup()
        end
    }
}
