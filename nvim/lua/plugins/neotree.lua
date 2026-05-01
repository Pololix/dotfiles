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
            enable_git_status = true,
            enable_diagnostics = false,

            default_component_configs = {
                indent = {
                    with_expanders = true
                },
                modified = {
                    symbol = "!"
                },
                name = {
                    trailing_slash = true,
                    use_git_status_colors = false
                },
            },

            filesystem = {
                filtered_items = {
                    visible = true,
                    hide_dotfiles = true,
                    hide_gitignored = true,
                    hide_by_name = {
                        ".git",
                        ".cache",
                        "out",
                        "build",
                        "LICENSE",
                        "README.md"
                    }
                },
                follow_current_file = {
                    enable = true,
                    leave_dirs_open = false
                },
                group_empty_dirs = true
            },

            mappings = {
                i = {
                    ["<A-Esc>"] = require("telescope.actions").close
                },
                n = {
                    ["<esc>"] = require("telescope.actions").close
                }
            }
        })
    end

}
