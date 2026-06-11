local greyshift = {
    "Pololix/greyshift.nvim",
    priority = 1000,

    config = function()
        require("greyshift").setup()
        vim.cmd.colorscheme("greyshift")
    end,
}

local easyicons = {
    "Pololix/easy-icons.nvim",
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
            stem = {
                ["$-colors"] = { icon = "", hl = palette.grey.lightest },
            },
            ext = {
                -- code
                ["lua"] = { icon = "󰢱", hl = palette.blue.dark },
                ["ts"] = { icon = "", hl = palette.blue.dark },

                -- support
                ["sh"] = { icon = "", hl = palette.grey.lightest },
                ["conf"] = { icon = "", hl = palette.grey.lightest },

                -- data
                ["json"] = { icon = "", hl = palette.yellow.dark },
                ["toml"] = { icon = "", hl = palette.yellow.dark },
            },
        })
    end,
}

local lualine = {
    "nvim-lualine/lualine.nvim",

    config = function()
        require("lualine").setup({
            options = {
                theme = "auto",
                globvalstatus = true,
            },
            sections = {
                lualine_a = { "mode" },
                lualine_b = { "branch" },
                lualine_c = { { "filename", path = 1 }, "diagnostics" },
                lualine_x = {},
                lualine_y = {},
                lualine_z = { "filetype" },
            },
        })
    end,
}

return { greyshift, easyicons, lualine }
