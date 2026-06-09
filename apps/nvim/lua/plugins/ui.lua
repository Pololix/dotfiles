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
