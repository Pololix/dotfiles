local o = { noremap = true, silent = true }
local map = vim.keymap.set

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
        "neovim/nvim-lspconfig",
    },

    config = function()
        require("mason-lspconfig").setup({
            automatic_installation = true,
            ensure_installed = {
                "lua_ls",
                "ts_ls",

                "jsonls",
            },
        })
    end,
}

local mason_tool_installer = {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = {
        "mason-org/mason.nvim",
        "mason-org/mason-lspconfig.nvim",
    },

    config = function()
        require("mason-tool-installer").setup({
            ensure_installed = {
                "stylua",
                "prettier",
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

        map("n", "gd", vim.lsp.buf.definition, o)
        map("n", "gh", vim.lsp.buf.hover, o)
        map("n", "rn", vim.lsp.buf.rename, o)
        map("n", "ca", vim.lsp.buf.code_action, o)

        require("lsp.lua_ls")
        require("lsp.ts_ls")
    end,
}

return { mason, mason_lspconfig, mason_tool_installer, lsp_config }
