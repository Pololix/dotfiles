local treesitter = {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",

    config = function()
        require("nvim-treesitter").setup({
            auto_install = true,

            ensure_installed = {
                "lua",
                "typescript",

                "json",
                "toml",
            },

            highlight = { enable = true },
        })
    end,
}
return treesitter
