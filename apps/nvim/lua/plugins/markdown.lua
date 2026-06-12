local render_markdown = {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "Pololix/easy-icons.nvim",
    },
    ft = { "markdown" },

    config = function()
        require("render-markdown").setup({
            heading = {
                width = "full",
            },
            code = {
                width = "block",
                right_pad = 1,
            },
        })
    end,
}

return render_markdown
