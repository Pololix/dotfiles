local neotree = {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        "Pololix/easy-icons.nvim",
        "nvim-telescope/telescope.nvim",
    },
    config = function()
        require("opts.neotree").setup()
    end,
}

local telescope = {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-ui-select.nvim",
        "Pololix/easy-icons.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
        require("opts.telescope").setup()
    end,
}

return { neotree, telescope }
