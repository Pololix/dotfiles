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
                "stylua",
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

        local o = { noremap = true, silent = true }
        local mappings = {
            { "n", "gd", vim.lsp.buf.definition, o },
            { "n", "gh", vim.lsp.buf.hover, o },
            { "n", "gr", vim.lsp.buf.rename, o },
            { "n", "ca", vim.lsp.buf.code_action, o },
        }

        for _, k in ipairs(mappings) do
            vim.keymap.set(k[1], k[2], k[3], k[4])
        end
    end,
}


return { mason, mason_lspconfig, lsp_config }
