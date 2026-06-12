local treesitter = {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",

    config = function()
        require("nvim-treesitter").setup({
            auto_install = true,

            ensure_installed = {
                "lua",
                "typescript",
                "tsx",

                "json",
                "toml",

                "markdown",
                "markdown_inline",
            },

            highlight = { enable = true },
        })
    end,
}
return treesitter
