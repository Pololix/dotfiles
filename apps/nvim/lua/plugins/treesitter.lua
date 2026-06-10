local treesitter = {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",

    config = function()
        require("nvim-treesitter").setup({
            auto_install = true,
            sync_install = false,

            ensure_installed = {
                "lua",
                "rust",
                "gdscript",

                "json",
                "toml",
            },

            highlight = { enable = true },
        })
    end,
}
return treesitter
