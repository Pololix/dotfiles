return {
    { -- neotree
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
                }
            })
        end
    },

    { -- telescope
        "nvim-telescope/telescope.nvim",
        version = "v0.2.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-ui-select.nvim",
            -- "nvim-telescope/telescope-file-browser.nvim",
            "nvim-mini/mini.icons",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }
        },
        config = function()
            local actions = require("telescope.actions")

            require("telescope").setup({
                defaults = {
                    prompt_prefix = " ",
                    sorting_strategy = "ascending",
                    layout_strategy = "horizontal",
                    layout_config = {
                        horizontal = {
                            prompt_position = "top",
                        }
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
                        "%.json$"
                    },
                    mappings = {
                        i = {
                            ["<Esc>"] = actions.close
                        }
                    }
                },
                pickers = {
                    buffers = {
                        initial_mode = "normal"
                    }
                },
                extensions = {
                    ["ui-select"] = { require("telescope.themes").get_dropdown {} }
                }
            })

            require("telescope").load_extension("fzf")
            require("telescope").load_extension("ui-select")
        end
    }
}
