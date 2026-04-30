return {
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter").setup({
                ensure_installed = { "lua", "cpp" },
                auto_install = true,
                highlight = {
                    enable = true
                },
                vim.api.nvim_create_autocmd("FileType", {
                    pattern = { "<filetype>" },
                    callback = function()
                        vim.treesitter.start()
                    end
                })
            })
        end
    }
}
