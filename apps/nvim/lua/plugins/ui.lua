local easyicons = {
    "Pololix/easy-icons.nvim",

    config = function()
        local palette = require("core.palette")

        require("easy-icons").setup({
            name = {
                [".gitignore"] = { icon = "󰊢", hl = palette.error },
            },
            stem = {
                ["$-colors"] = { icon = "", hl = palette.outline },
            },
            ext = {
                -- code
                ["lua"] = { icon = "󰢱", hl = palette.primary },
                ["ts"] = { icon = "", hl = palette.tertiary },

                -- support
                ["sh"] = { icon = "", hl = palette.on_surface_variant },
                ["conf"] = { icon = "", hl = palette.on_surface_variant },

                -- data formats
                ["json"] = { icon = "", hl = palette.secondary },
                ["toml"] = { icon = "", hl = palette.secondary },
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

return { easyicons, lualine }
