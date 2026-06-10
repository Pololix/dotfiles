local o = { noremap = true, silent = true }
local map = vim.keymap.set

-- quick :messages
map("n", "<leader>?", "<cmd>messages<CR>", o)

-- writing and quitting
map("n", "<leader>w", "<cmd>w<CR>", o)
map("n", "<leader>q", "<cmd>q!<CR>", o)
map("n", "<leader>wq", "<cmd>wq<CR>", o)
map("t", "<esc>", "<cmd>q!<CR>", o)

-- window navigation
map("n", "<leader>h", "<C-w>h", o)
map("n", "<leader>j", "<C-w>j", o)
map("n", "<leader>k", "<C-w>k", o)
map("n", "<leader>l", "<C-w>l", o)

map("n", "<leader>d", "<cmd>vsplit<CR>", o)
map("n", "<leader>s", "<cmd>split<CR>", o)

-- search related
map("n", "n", "nzz", o)
map("n", "<S-n>", "Nzz", o)
map("n", "<esc>", "<cmd>noh<CR>")

-- line movement
map("v", "<S-j>", ":m '>+1<CR>gv=gv", o)
map("v", "<S-k>", ":m '<-2<CR>gv=gv", o)
map("v", "<Tab>", ">gv", o)
map("v", "<S-Tab>", "<gv", o)
