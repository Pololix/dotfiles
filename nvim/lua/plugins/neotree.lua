return {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        "nvim-telescope/telescope.nvim",
        "nvim-mini/mini.icons"
    },
    config = function()
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
                        "CMakeLists.txt"
                    },

                    hide_by_pattern = {

                    }
                }
            },

            default_component_configs = {
                icon = {
                    folder_closed = "󰉋",
                    folder_open = "󰝰",
                    folder_empty = "󰉖",
                    folder_empty_open = "󰷏",

                    default = ""
                },

                modified = {
                    symbol = "!",
                },

                name = {
                    trailing_slash = true,
                    use_git_status_colors = false,
                },

                git_status = {
                    symbols = {
                        added     = "",
                        deleted   = "",
                        modified  = "",
                        renamed   = "",
                        untracked = "",
                        ignored   = "",
                        unstaged  = "",
                        staged    = "",
                        conflict  = "",
                    },
                }
            }
        })
    end
}
