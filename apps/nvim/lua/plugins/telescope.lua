local o = { noremap = true, silent = true }
local map = vim.keymap.set

local telescope = {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-ui-select.nvim",
        "Pololix/easy-icons.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },

    config = function()
        require("telescope").setup({
            defaults = {
                prompt_prefix = " > ",
                selection_caret = "  ",
                entry_prefix = "  ",

                sorting_strategy = "ascending",
                layout_strategy = "center",

                path_display = { "smart" },
                hidden = false,
                file_ignore_patterns = require("extras.ignore").telescope,
            },
            pickers = {
                buffers = {
                    initial_mode = "normal",
                },
            },
            extensions = {
                ["ui-select"] = { require("telescope.themes").get_dropdown({}) },
            },
        })

        require("telescope").load_extension("ui-select")

        map("n", "<leader>m", require("telescope.builtin").find_files, o)
        map("n", "<leader>M", require("telescope.builtin").live_grep, o)
    end,
}

return telescope
