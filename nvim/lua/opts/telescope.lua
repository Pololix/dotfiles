local M = {}

function M.setup()
    require("telescope").setup({
        defaults = {
            prompt_prefix = " ",
            sorting_strategy = "ascending",
            layout_strategy = "horizontal",
            layout_config = {
                horizontal = {
                    prompt_position = "top",
                },
            },
            path_display = { "truncate" },
            dynamic_preview_title = true,
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
end

return M
