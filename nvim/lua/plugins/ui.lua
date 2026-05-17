local greyshift = {
    "Pololix/greyshift.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("greyshift").setup()
        vim.cmd.colorscheme("greyshift")
    end,
}

local easyicons = {
    "Pololix/easy-icons.nvim",
    config = function()
        require("opts.easy_icons").setup()
    end,
}

return { greyshift, easyicons }
