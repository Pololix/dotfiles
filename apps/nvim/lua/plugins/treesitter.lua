local treesitter = {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",

    config = function()
        require("nvim-treesitter").setup()

        require("nvim-treesitter").install({
            "lua",
            "rust",
            "wgsl",
            "json",
            "toml",
        })

        vim.api.nvim_create_autocmd("FileType", {
            pattern = {
                "lua",
                "rust",
                "wgsl",
                "json",
                "toml",
            },
            callback = function(args)
                vim.treesitter.start(args.buf)
            end,
        })
    end,
}

return treesitter
