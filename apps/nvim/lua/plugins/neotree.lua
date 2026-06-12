local o = { noremap = true, silent = true }
local map = vim.keymap.set

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
                    expander_expanded = "",
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
                    enabled = true,
                },
            },

            sources = { "filesystem" },

            filesystem = {
                group_empty_dirs = true,

                filtered_items = {
                    visible = true,
                    hide_by_name = require("extras.ignore").neotree,
                },

                follow_current_file = {
                    enabled = true,
                },
            },
            event_handlers = {
                {
                    event = "neo_tree_puopup_input_ready",
                    handler = function(args)
                        vim.cmd("stopinsert")
                        vim.keymap.set("i", "<esc>", vim.cmd.stopinsert, { noremap = true, buffer = args.bufnr })
                    end,
                },
            },
        })

        -- pTODO: create autocmd to remove signcolumn from neotree buffers
        map("n", "<leader><S-n>", "<cmd>Neotree focus float<CR>", o)
        map("n", "<leader>n", function()
            local state = require("neo-tree.sources.manager").get_state("filesystem")

            if
                require("neo-tree.ui.renderer").window_exists(state)
                and vim.api.nvim_get_current_win() == state.winid
            then
                vim.cmd("Neotree close")
            else
                vim.cmd("Neotree focus left")
            end
        end, o)

        map("n", "<S-CR>", function()
            local state = require("neo-tree.sources.manager").get_state("filesystem")
            local node = state.tree:get_node()
            local depth = vim.v.count

            require("extras.neotree").mass_toggle(state, node, depth)
        end, o)
    end,
}

return neotree
