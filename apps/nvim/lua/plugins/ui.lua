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
    lazy = false,
    priority = 999,
    config = function()
        local palette = require("greyshift.palette").get()

        require("easy-icons").setup({
            name = {
                ["init.lua"] = { icon = "󰢱", hl = palette.purple.dark },
                ["hyprland.lua"] = { icon = "󰢱", hl = palette.purple.dark },

                [".gitignore"] = { icon = "󰊢", hl = palette.red.dark },
                ["todo.md"] = { icon = "", hl = palette.white },
            },
            ext = {
                ["json"] = { icon = "", hl = palette.yellow.dark },
                ["conf"] = { icon = "", hl = palette.grey.lighter },

                ["lua"] = { icon = "󰢱", hl = palette.blue.dark },
                ["sh"] = { icon = "", hl = palette.white },
            },
        })
    end,
}

return { greyshift, easyicons }
