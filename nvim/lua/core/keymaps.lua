local o = { noremap = true, silent = true }

local M = {
    -- quick :messages
    { "n", "<leader>?", "<cmd>messages<CR>", o },

    -- writing and quiting
    { "n", "<leader>w", "<cmd>w<CR>", o },
    { "n", "<leader>q", "<cmd>q!<CR>", o },
    { "n", "<leader>wq", "<cmd>wq<CR>", o },

    -- window nav
    { "n", "<leader>h", "<C-w>h", o },
    { "n", "<leader>j", "<C-w>j", o },
    { "n", "<leader>k", "<C-w>k", o },
    { "n", "<leader>l", "<C-w>l", o },

    { "n", "<leader>d", "<cmd>vsplit<CR>", o },
    { "n", "<leader>s", "<cmd>split<CR>", o },

    -- search related
    { "n", "n", "nzz", o },
    { "n", "<S-n>", "Nzz", o },
    { "n", "<esc>", "<cmd>noh<CR>", o },

    -- line movement
    { "v", "<S-Tab>", "<gv", o },
    { "v", "<Tab>", ">gv", o },
    { "v", "<S-j>", "<cmd>m '>+1<CR>gv=gv", o },
    { "v", "<S-k>", "<cmd>m '<-2<CR>gv=gv", o },

    -- lsp related
    { "n", "gd", vim.lsp.buf.definition, o },
    { "n", "gh", vim.lsp.buf.hover, o },
    { "n", "gr", vim.lsp.buf.rename, o },
    { "n", "ca", vim.lsp.buf.code_action, o },

    -- plugins
    -- neotree
    {
        "n",
        "<leader>n",
        function()
            local state = require("neo-tree.sources.manager").get_state("filesystem")

            if
                require("neo-tree.ui.renderer").window_exists(state)
                and vim.api.nvim_get_current_win() == state.winid
            then
                vim.cmd("Neotree close")
            else
                vim.cmd("Neotree focus left")
            end
        end,
        o,
    },
    { "n", "<leader><S-n>", "<cmd>Neotree focus float<CR>", o },
    {
        "n",
        "<S-CR>",
        function()
            local state = require("neo-tree.sources.manager").get_state("filesystem")
            local node = state.tree:get_node()
            local depth = vim.v.count

            require("extras.neotree").mass_toggle(state, node, depth)
        end,
        o,
    },

    -- telescope
    { "n", "<leader>m", require("telescope.builtin").find_files, o },
    { "n", "<leader>M", require("telescope.builtin").live_grep, o },

    -- toggleterm
    { "n", "<leader>t", "<cmd>ToggleTerm<CR>", o },

    -- lazygit
    { "n", "<leader>g", "<cmd>LazyGit<CR>", o },

    -- conform
    {
        "n",
        "fa",
        function()
            require("conform").format({ async = true, lsp_fallback = true })
        end,
        o,
    },

    -- lint
}

for _, k in ipairs(M) do
    vim.keymap.set(k[1], k[2], k[3], k[4])
end
