return {
    { -- mason
        "mason-org/mason.nvim",
        build = ":MasonUpdate",
        config = function()
            require("mason").setup()
        end,
    },

    { -- mason-tool-installer
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        config = function()
            require("mason-tool-installer").setup({
                auto_update = false,
                run_on_start = true,
                ensure_installed = {
                    -- language servers
                    "lua-language-server",
                    -- formaters
                    "stylua",
                    -- linters
                    -- debug adapters
                },
            })
        end,
    },

    { -- lspconfig
        "neovim/nvim-lspconfig",
        config = function()
            vim.diagnostic.config({
                signs = true,
                virtual_text = {
                    prefix = ">",
                    spacing = 5,
                },
            })

            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities.textDocument.foldingRange = {
                dynamicRegistration = false,
                lineFoldingOnly = true,
            }

            -- capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

            vim.lsp.config("lua_ls", {
                capabilities = capabilities,
                settings = {
                    Lua = {
                        runtime = {
                            version = "LuaJIT",
                        },
                        diagnostics = {
                            globals = {
                                "vim",
                                "hl",
                            },
                        },
                    },
                },
            })
            vim.lsp.enable("lua_ls")
        end,
    },
}
