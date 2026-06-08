local mason = {
    "mason-org/mason.nvim",
    build = ":MasonUpdate",

    config = function()
        require("mason").setup()
    end,
}

local mason_lspconfig = {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
        "mason-org/mason.nvim",
    },

    config = function()
        require("mason-lspconfig").setup({
            automatic_installation = true,
            ensure_installed = {
                "lua_ls",
                "rust_analyzer",
                "gopls",
            },

            handlers = {
                function(server_name)
                    vim.lsp.enable(server_name)
                end,
            },
        })
    end,
}

local lsp_config = {
    "neovim/nvim-lspconfig",

    config = function()
        vim.diagnostic.config({
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = "",
                    [vim.diagnostic.severity.WARN] = "",
                    [vim.diagnostic.severity.HINT] = "",
                    [vim.diagnostic.severity.INFO] = "",
                },
            },
            virtual_text = {
                prefix = ">",
                spacing = 5,
            },
        })
    end,
}

local conform = {
    "stevearc/conform.nvim",

    config = function()
        require("conform").setup({
            fomatters_by_ft = {
                lua = { "stylua "},
                rust = { "rustfmt" },
                gdscript = { "gdformat" },
            },
            format_on_save = true,
        })
    end
}

return { mason, mason_lspconfig, lsp_config, conform }
