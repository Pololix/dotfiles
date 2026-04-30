return {
    {
        "sainnhe/everforest",
        lazy = false,
        priority = 1000,
        config = function()
            vim.g.everforest_background = "hard"
            vim.g.everforest_enable_italic = true
            vim.g.everforest_disable_italic_comment = false
            vim.g.everforest_cursor = "auto"
            vim.g.everforest_ui_contrast = "low"
            vim.g.everforest_float_style = "bright"
            vim.g.everforest_dim_inactive_windows = false
            vim.g.everforest_show_eob = false
            vim.g.everforest_diagnostic_text_highlight = false
            vim.g.everforest_diagnostic_line_highlight = false
            vim.g.everforest_diagnostic_virtual_text = "grey"
            vim.g.everforest_current_word = "grey background"
            vim.g.everforest_inlay_hints_background = "none"
            vim.g.everforest_spell_foreground = "none"
            vim.g.everforest_better_performance = true
            vim.g.everforest_disable_terminal_colors = false
            vim.o.background = "dark"
            vim.cmd.colorscheme("everforest")
        end
    },

    {
        "nvim-mini/mini.icons",
        config = function()
            require("mini.icons").setup()
            MiniIcons.mock_nvim_web_devicons()
        end
    }
}
