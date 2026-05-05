return {
    { -- mason
        "mason-org/mason.nvim",
        build = ":MasonUpdate",
        config = function()
            require("mason").setup()
        end
    },

    { -- mason-lspconfig
        "mason-org/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                autoinstall = true,
                ensure_installed = {
                    -- language servers
                    "lua_ls",
                    "clangd"
                    -- formaters and linters
                    -- debug adapters
                }
            })
        end
    },

    { -- lspconfig
        "neovim/nvim-lspconfig",
        config = function()
            vim.diagnostic.config({
                signs = true,
                virtual_text = {
                    prefix = ">",
                    spacing = 5
                }
            })

            local capabilities = vim.lsp.protocol.make_client_capabilities()
            -- ufo folds
            capabilities.textDocument.foldingRange = {
                dynamicRegistration = false,
                lineFoldingOnly     = true
            }

            -- capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

            vim.lsp.config("lua_ls", {
                capabilities = capabilities,
                settings = {
                    Lua = {
                        runtime = {
                            version = "LuaJIT"
                        }
                    }
                }
            })
            vim.lsp.enable("lua_ls")

            vim.lsp.config("clangd", {
                capabilities = capabilities,
                cmd = {
                    "clangd",
                    "--background-index",
                    "--clang-tidy",
                    "--header-insertion=iwyu",
                    "--completion-style=detailed",
                    "--function-arg-placeholders",
                    "--fallback-style=llvm"
                },
                root_markers = {
                    "compile_commands.json",
                    "compile_flags.txt",
                    ".clangd",
                    ".git"
                },
                settings = {
                    clangd = {
                        InalyHints = {
                            Designators = true,
                            Enabled = true,
                            ParameterNames = true,
                            DeducedTypes = true
                        }
                    }
                }
            })
            vim.lsp.enable("clangd")
        end
    }
}
