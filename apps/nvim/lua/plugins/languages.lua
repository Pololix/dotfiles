local languages = require("extras.languages")

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

            ensure_installed = languages.flatten(
                languages.get("ls"),
                languages.get("formatter"),
                languages.get("linter")
            ),
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

        languages.setup_ls(capabilities)
    end,
}

local conform = {
    "stevearc/conform.nvim",
    config = function()
        require("conform").setup({
            formatters_by_ft = languages.get_by_ft("formatter"),

            format_on_save = function()
                return { timeout_ms = 500, lsp_fallback = true }
            end,
        })
    end,
}

local lint = {
    "mfussenegger/nvim-lint",
    config = function()
        local lint = require("lint")

        lint.linters_by_ft = languages.get_by_ft("linter")

        vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
            group = vim.api.nvim_create_augroup("nvim-lint", { clear = true }),
            callback = function()
                lint.try_lint()
            end,
        })
    end,
}

return { mason, mason_tool_installer, lsp_config, conform, lint }
