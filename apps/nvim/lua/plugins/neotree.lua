local neotree = {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        "Pololix/easy-icons.nvim",
        "nvim-telescope/telescope.nvim",
    },
    config = function()
        require("neo-tree").setup({
            close_if_last_window = true,
            enable_diagnostics = false,
            popup_border_style = "rounded",

            default_component_configs = {
                indent = {
                    with_expanders = true,
                    expander_collapsed = "",
                    expander_expanded  = "",
                },

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
                        renamed = "",
                        untracked = "",
                        ignored = "",
                        unstaged = "",
                        staged = "",
                        conflict = "",
                    },
                },

                symlink_target = {
                    enabled = true
                }
            },

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

                follow_current_file = {
                    enabled = true
                }
            },
            event_handlers = {
                {
                    event = "neo_tree_puopup_input_ready",
                    handler = function(args)
                        vim.cmd("stopinsert")
                        vim.keymap.set("i", "<esc>", vim.cmd.stopinsert, { noremap = true, buffer = args.bufnr })
                    end
                }
            }
        })
    end,
}

return neotree
