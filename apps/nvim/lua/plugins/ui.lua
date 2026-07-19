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
                ["rs"] = { icon = "", hl = palette.primary },
                ["ts"] = { icon = "", hl = palette.tertiary },
                ["tsx"] = { icon = "", hl = palette.tertiary },
                ["svelte"] = { icon = "", hl = palette.tertiary },
                ["css"] = { icon = "", hl = palette.tertiary },
                ["html"] = { icon = "", hl = palette.tertiary },

                -- support
                ["sh"] = { icon = "", hl = palette.on_surface_variant },

                -- data formats
                ["json"] = { icon = "", hl = palette.secondary },
                ["toml"] = { icon = "", hl = palette.secondary },
                ["conf"] = { icon = "", hl = palette.secondary },
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

local alpha = {
    "goolord/alpha-nvim",
    dependencies = {
        "Pololix/easy-icons.nvim",
    },
    event = "VimEnter",

    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

        dashboard.section.header.val = {
            "                                                     ",
            "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
            "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
            "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
            "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
            "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
            "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
            "                                                     ",
        }

        dashboard.section.buttons.val = {
            dashboard.button("n", "  New File", ":ene <BAR> startinsert<CR>"),

            dashboard.button("d", "  Dotfiles", ":e ~/dotfiles/<CR>"),
            dashboard.button("p", "  Repos", ":e ~/repos/<CR>"),

            dashboard.button("c", "  Settings", ":e ~/dotfiles/apps/nvim/<CR>"),
        }
        dashboard.config.layout = {
            { type = "padding", val = 2 },
            dashboard.section.header,
            { type = "padding", val = 2 },
            dashboard.section.buttons,
        }

        alpha.setup(dashboard.config)

        vim.api.nvim_create_autocmd("User", {
            pattern = "BDeletePost*",
            callback = function(event)
                local fallback_name = vim.api.nvim_buf_get_name(event.buf)
                local fallback_ft = vim.api.nvim_get_option_value("filetype", { buf = event.buf })
                local fallback_empty = fallback_name == "" and fallback_ft == ""
                if fallback_empty then
                    vim.cmd("Alpha")
                end
            end,
        })
    end,
}

return { easyicons, lualine, alpha }
