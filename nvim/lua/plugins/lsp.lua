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
        require("opts.mason_tool_installer").setup()
    end,
}

local lsp_config = {
    "neovim/nvim-lspconfig",
    config = function()
        require("opts.lsp_config").setup()
    end,
}

local conform = {
    "stevearc/conform.nvim",
    config = function()
        require("opts.conform").setup()
    end,
}

local lint = {
    "mfussenegger/nvim-lint",
    config = function()
        require("opts.lint").setup()
    end,
}

return { mason, mason_tool_installer, lsp_config, conform, lint }
