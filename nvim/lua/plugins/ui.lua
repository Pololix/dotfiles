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
            local palette = require("greyshift.palette").get()
            require("easy-icons").setup({
                name = {
                    ["init.lua"]     = { icon = "󰢱", hl = palette.purple.dark },
                    ["hyprland.lua"] = { icon = "󰢱", hl = palette.purple.dark },

                    [".gitignore"]   = { icon = "󰊢", hl = palette.red.dark },
                    ["todo&.txt"]    = { icon = "", hl = palette.white },
                },
                ext = {
                    ["lua"]  = { icon = "󰢱", hl = palette.blue.dark },
                    ["json"] = { icon = "", hl = palette.yellow.dark },
                    ["conf"] = { icon = "", hl = palette.grey.lighter },

                    ["h"]    = { icon = "", hl = palette.purple.dark },
                    ["c"]    = { icon = "", hl = palette.blue.dark },
                    ["hpp"]  = { icon = "", hl = palette.purple.dark },
                    ["cpp"]  = { icon = "", hl = palette.blue.dark },
                }
            })
        end
    }
}
