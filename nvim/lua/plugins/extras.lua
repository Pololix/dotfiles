local autopairs = {
    "windwp/nvim-autopairs",
    config = function()
        require("opts.autopairs").setup()
    end,
}

local toggleterm = {
    "akinsho/toggleterm.nvim",
    config = function()
        require("toggleterm").setup()
    end,
}

local ufo = {
    "kevinhwang91/nvim-ufo",
    dependencies = {
        "kevinhwang91/promise-async",
    },
    config = function()
        require("opts.ufo").setup()
    end,
}

return { autopairs, toggleterm, ufo }
