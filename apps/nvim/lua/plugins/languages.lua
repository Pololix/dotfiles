local mason = {
    "mason-org/mason.nvim",
    build = ":MasonUpdate",
    config = function()
        require("mason").setup()
    end,
}

local mason_tool_installer = {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    config = function()
        require("mason-tool-installer").setup({
            auto_update = false,
            run_on_start = true,

            ensure_installed = {
                -- language servers
                "lua-language-server",
                -- linters
                -- formatters
                -- debuggers
            },
        })
    end,
}

local lsp_config = {
    "neovim/nvim-lspconfig",
    dependencies = {
        "Pololix/easy-icons.nvim",
        "saghen/blink.cmp",
    },
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

        local capabilities = vim.tbl_deep_extend(
            "force",
            vim.lsp.protocol.make_client_capabilities(),
            require("blink.cmp").get_lsp_capabilities()
        )

        vim.lsp.config("lua_ls", {
            cmd = { "lua-language-server" },
            capabilities = capabilities,

            filetypes = { "lua" },
            root_markers = { ".luarc.json", ".luarc.jsonc", "stylua.toml", ".git" },
            single_file_support = true,

            settings = {
                Lua = {
                    runtime = { version = "LuaJIT" },
                    workspace = {
                        checkThirdParty = false,
                        library = { vim.env.VIMRUNTIME },
                    },
                    telemetry = { enable = false },
                },
            },
        })

        vim.lsp.enable("lua_ls")
    end,
}

local conform = {
    "stevearc/conform.nvim",
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                lua = { "stylua" },
            },

            format_on_save = function()
                return { timeout_ms = 500, lsp_fallback = true }
            end,
        })
    end,
}

return { mason, mason_tool_installer, lsp_config, conform }
