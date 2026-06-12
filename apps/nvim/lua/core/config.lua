local o = vim.opt

-- number line
o.number = true
o.relativenumber = true
o.signcolumn = "yes"

-- status line
o.showmode = false
o.cmdheight = 1
o.laststatus = 3

-- cursor
o.cursorline = true
o.sidescrolloff = 12
o.scrolloff = 12

-- identations
o.tabstop = 4
o.shiftwidth = 4
o.expandtab = true
o.smartindent = true

-- wrapping
o.wrap = false

-- search
o.hlsearch = true
o.ignorecase = true
o.smartcase = true

-- backup
o.backup = false
o.writebackup = false
o.swapfile = false

o.autoread = true
o.autowrite = false
o.confirm = true

-- splits
o.splitright = true
o.splitbelow = true

-- folds
o.foldmethod = "expr"
o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
o.foldcolumn = "2"
o.foldlevelstart = 99

-- other
o.termguicolors = true
o.updatetime = 250
o.timeoutlen = 500
o.clipboard = "unnamedplus"
o.list = true

-- chars
o.listchars = {
    extends = "",
    precedes = " ",
}
o.fillchars = {
    eob = " ",
    fold = " ",
    foldopen = "",
    foldclose = "",
    foldinner = " ",
    foldsep = " ",
}
