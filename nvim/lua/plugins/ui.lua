return {
    {
        "Pololix/greyshift-nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("greyshift").setup({})
            vim.cmd.colorscheme("greyshift")
        end
    }
}
