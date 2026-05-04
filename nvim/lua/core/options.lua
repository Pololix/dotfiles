local o          = vim.opt

-- number line
o.number         = true
o.relativenumber = true
o.signcolumn     = "yes"

-- status line
o.showmode       = false
o.cmdheight      = 1
o.laststatus     = 3

-- cursor
o.cursorline     = true
o.sidescrolloff  = 12
o.scrolloff      = 12

-- identations
o.tabstop        = 4
o.shiftwidth     = 4
o.expandtab      = true
o.smartindent    = true

-- wrapping
o.wrap           = false

-- search
o.hlsearch       = true
o.ignorecase     = true
o.smartcase      = true

-- backup
o.backup         = false
o.writebackup    = false
o.swapfile       = false

o.autoread       = true
o.autowrite      = false
o.confirm        = true

-- splits
o.splitright     = true
o.splitbelow     = true

-- other
o.termguicolors  = true
o.updatetime     = 250
o.timeoutlen     = 500
o.clipboard      = "unnamedplus"
o.list           = true
o.listchars      = {
    extends = "»",
}
o.fillchars      = {
    eob = " ",
    -- fold = " ",
    -- foldopen = " ",
    -- foldclose = " "
}
