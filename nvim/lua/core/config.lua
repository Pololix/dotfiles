local M = {
    -- number line
    number = true,
    relativenumber = true,
    signcolumn = "yes",

    -- status line
    showmode = false,
    cmdheight = 1,
    laststatus = 3,

    -- cursor
    cursorline = true,
    sidescrolloff = 12,
    scrolloff = 12,

    -- identations
    tabstop = 4,
    shiftwidth = 4,
    expandtab = true,
    smartindent = true,

    -- wrapping
    wrap = false,

    -- search
    hlsearch = true,
    ignorecase = true,
    smartcase = true,

    -- backup
    backup = false,
    writebackup = false,
    swapfile = false,

    autoread = true,
    autowrite = false,
    confirm = true,

    -- splits
    splitright = true,
    splitbelow = true,

    -- folds
    foldmethod = "expr",
    foldexpr = "v:lua.vim.treesitter.foldexpr()",
    foldcolumn = "2",
    foldlevelstart = 99,

    -- other
    termguicolors = true,
    updatetime = 250,
    timeoutlen = 500,
    clipboard = "unnamedplus",
    list = true,

    -- chars
    listchars = {
        extends = "",
        precedes = " ",
    },
    fillchars = {
        eob = " ",
        fold = " ",
        foldopen = "",
        foldclose = "",
        foldinner = " ",
        foldsep = " ",
    },
}

for config, value in pairs(M) do
    vim.opt[config] = value
end
