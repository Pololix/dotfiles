return {
    {
        "Pololix/greyshift.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("greyshift").setup()
            vim.cmd.colorscheme("greyshift")
        end
    },

    {
        "Pololix/easy-icons.nvim",
        config = function()
            local palette = require("greyshift.palette")
            require("easy-icons").setup({
                name = {
                    ["init.lua"]     = { icon = "󰢱", hl = palette.base.purple.dark },
                    ["hyprland.lua"] = { icon = "󰢱", hl = palette.base.purple.dark },

                    [".gitignore"]   = { icon = "󰊢", hl = palette.base.red.dark },
                    ["todo&.txt"]    = { icon = "", hl = palette.base.white },
                },
                ext = {
                    ["lua"]  = { icon = "󰢱", hl = palette.base.blue.dark },
                    ["json"] = { icon = "", hl = palette.base.yellow.dark },
                    ["conf"] = { icon = "", hl = palette.base.grey.lighter },

                    ["h"]    = { icon = "", hl = palette.base.purple.dark },
                    ["c"]    = { icon = "", hl = palette.base.blue.dark },
                    ["hpp"]  = { icon = "", hl = palette.base.purple.dark },
                    ["cpp"]  = { icon = "", hl = palette.base.blue.dark },
                }
            })
        end
    }
}
