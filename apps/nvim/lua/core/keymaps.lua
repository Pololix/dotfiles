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
}

for _, k in ipairs(M) do
    vim.keymap.set(k[1], k[2], k[3], k[4])
end
