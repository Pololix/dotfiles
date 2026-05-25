local treesitter = {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter").setup({
            auto_install = true,
            sync_install = false,

            ensure_installed = {
                "lua",
            },

            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
        })
    end,
}

local blink = {
    {
        "saghen/blink.cmp",
        dependencies = {
            "saghen/blink.lib",
        },
        config = function()
            require("blink.cmp").setup({
                keymap = { preset = "default" },
                sources = {
                    default = { "lsp", "path", "snippets", "buffer" },
                },
                fuzzy = { implementation = "lua" },
            })
        end,
    },
}

return { treesitter, blink }
