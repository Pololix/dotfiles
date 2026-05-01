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
                ensure_installed = {
                    "lua_ls",
                    "clangd"
                },
                autoinstall = true
            })
        end
    },

    { -- lspconfig
        "neovim/nvim-lspconfig",
        config = function()
            local map = vim.keymap.set

            map("n", "gh", vim.lsp.buf.hover)
            map("n", "gs", vim.lsp.buf.signature_help)
            map("n", "<Tab>s", "<Plug>(nvim.lsp.ctrl-s)")
            map("n", "gd", vim.lsp.buf.definition)
            map("n", "gD", vim.lsp.buf.declaration)
            map("n", "gi", vim.lsp.buf.implementation)
            map("n", "ra", vim.lsp.buf.rename)
            map("n", "fa", vim.lsp.buf.format)
            map("n", "ca", vim.lsp.buf.code_action)

            vim.diagnostic.config({
                signs = true,
                virtual_text = {
                    prefix = ">",
                    spacing = 5
                },
                float = {
                    border = "rounded",
                    source = "never",
                }
            })

            local capabilities = vim.lsp.protocol.make_client_capabilities()

            vim.lsp.config("lua_ls", {
                capabilities = capabilities,
                settings = {
                    Lua = {
                        runtime = {
                            version = "LuaJIT"
                        },
                        diagnostics = {
                            globals = {}
                        },
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
