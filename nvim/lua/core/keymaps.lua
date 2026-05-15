local map = vim.keymap.set
local o = { noremap = true, silent = true }
local extras = require("extras")

-- errors
map("n", "<leader>?", "<cmd>messages<CR>", o)

-- window nav
map("n", "<leader>h", "<C-w>h", o)
map("n", "<leader>j", "<C-w>j", o)
map("n", "<leader>k", "<C-w>k", o)
map("n", "<leader>l", "<C-w>l", o)

-- search
map("n", "n", "nzz", o)
map("n", "N", "Nzz", o)
map("n", "<esc>", ":noh<CR>", o)

-- splits
map("n", "<leader>s", function()
    vim.cmd("split")
    vim.cmd("wincmd j")
    require("neo-tree.command").execute({
        reveal = true,
        position = "float",
    })
end, o)
map("n", "<leader>d", function()
    vim.cmd("vsplit")
    vim.cmd("wincmd l")
    require("neo-tree.command").execute({
        reveal = true,
        position = "float",
    })
end, o)

-- wq
map("n", "<leader>w", ":w<CR>", o)
map("n", "<leader>q", ":q<CR>", o)
map("n", "<leader>wq", ":wq<CR>", o)
map("n", "<leader><esc>", ":q!<CR>", o)

-- indentations
map("v", "<S-Tab>", "<gv", o)
map("v", "<Tab>", ">gv", o)

-- move lines
map("v", "J", ":m '>+1<CR>gv=gv", o)
map("v", "K", ":m '<-2<CR>gv=gv", o)

-- plugins
-- - neotree
local manager = require("neo-tree.sources.manager")
local renderer = require("neo-tree.ui.renderer")

map("n", "<leader>n", function()
    local state = manager.get_state("filesystem")

    if renderer.window_exists(state) and vim.api.nvim_get_current_win() == state.winid then
        vim.cmd("Neotree close")
    else
        vim.cmd("Neotree focus left")
    end
end, o)
map("n", "<leader>N", "<cmd>Neotree toggle float<CR>", o)
map("n", "<S-CR>", function()
    local state = manager.get_state("filesystem")
    local node = state.tree:get_node()
    local depth = vim.v.count

    extras.neotree.mass_toggle(state, node, depth)
end, o)

-- - telescope
local builtin = require("telescope.builtin")

map("n", "<leader>m", builtin.find_files, o)
map("n", "<leader>M", builtin.live_grep, o)

-- - lsp
map("n", "gh", vim.lsp.buf.hover, o)
map("n", "gs", vim.lsp.buf.signature_help, o)
map("n", "<Tab>s", "<Plug>(nvim.lsp.ctrl-s)", o)
map("n", "gd", vim.lsp.buf.definition, o)
map("n", "gD", vim.lsp.buf.declaration, o)
map("n", "gi", vim.lsp.buf.implementation, o)
map("n", "ra", vim.lsp.buf.rename, o)
map("n", "fa", vim.lsp.buf.format, o)
map("n", "ca", vim.lsp.buf.code_action, o)

-- - toggleterm
map("n", "<leader>t", "<cmd>ToggleTerm direction=float<CR>", o)
map({ "n", "t" }, "<S-Esc>", "<C-\\><C-n>:q!<CR>", o)

-- - ufo
local ufo = require("ufo")

map("n", "zr", ufo.openAllFolds, o)
map("n", "zm", ufo.closeAllFolds, o)
map("n", "K", ufo.peekFoldedLinesUnderCursor, o)
