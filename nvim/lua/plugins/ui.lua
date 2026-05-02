return {
    {
        "Pololix/greyshift-nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("greyshift").setup({})
            vim.cmd.colorscheme("greyshift")
        end
    },

    {
        "echasnovski/mini.icons",
        lazy = false,
        config = function()
            require("mini.icons").setup()

            require("mini.icons").mock_nvim_web_devicons()
        end,
    }
}
