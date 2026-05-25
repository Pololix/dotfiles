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

                path_display = { "smmart" },
                file_ignore_patterns = {
                    "%.git/",
                    "%.cache/",
                    "build/",
                    "out/",
                    "%.o$",
                    "%.a$",
                    "%.json$",
                },
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

        require("telescope").load_extension("fzf")
        require("telescope").load_extension("ui-select")
    end,
}

return telescope
