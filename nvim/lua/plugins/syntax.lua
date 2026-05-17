local treesitter = {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        require("opts.treesitter").setup()
    end,
}

return { treesitter }
