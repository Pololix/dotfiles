local M = {}

function M.setup()
    require("neo-tree").setup({
        close_if_last_window = true,
        enable_diagnostics = false,

        sources = { "filesystem" },

        filesystem = {
            group_empty_dirs = true,

            filtered_items = {
                visible = true,

                hide_by_name = {
                    "README.md",
                    "LICENSE",
                    "CMakeLists.txt",
                    "stylua.toml",
                },
            },
        },

        default_component_configs = {
            icon = {
                folder_closed = "󰉋",
                folder_open = "󰝰",
                folder_empty = "󰉖",
                folder_empty_open = "󰷏",

                default = " ",
            },

            modified = {
                symbol = "󱙃",
            },

            name = {
                trailing_slash = true,
                use_git_status_colors = false,
            },

            git_status = {
                symbols = {
                    added = "",
                    deleted = "",
                    modified = "",
                    renamed = "",
                    untracked = "",
                    ignored = "",
                    unstaged = "",
                    staged = "",
                    conflict = "",
                },
            },
        },
    })
end

return M
