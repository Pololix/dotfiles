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
                    ["init.lua"]     = { icon = "󰢱", hl = palette.accent.purple },
                    ["hyprland.lua"] = { icon = "󰢱", hl = palette.accent.purple },
                    [".gitignore"]   = { icon = "󰊢", hl = palette.accent.red },
                    ["todo&.txt"]    = { icon = "", hl = palette.accent.white },
                },
                ext = {
                    ["lua"]  = { icon = "󰢱", hl = palette.accent.blue },
                    ["json"] = { icon = "", hl = palette.accent.yellow },
                    ["conf"] = { icon = "", hl = palette.accent.grey },

                    ["h"]    = { icon = "", hl = palette.accent.purple },
                    ["c"]    = { icon = "", hl = palette.accent.blue },
                    ["hpp"]  = { icon = "", hl = palette.accent.purple },
                    ["cpp"]  = { icon = "", hl = palette.accent.blue },
                }
            })
        end
    }
}
