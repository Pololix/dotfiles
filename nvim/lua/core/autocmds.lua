local add = vim.api.nvim_create_autocmd
local group = vim.api.nvim_create_augroup

-- start treesitter
add("FileType", {
    pattern = { "<filetype>" },
    callback = function()
        vim.treesitter.start()
    end,
})

-- no signcolumn on neotree
add({ "BufWinEnter", "WinEnter" }, {
    callback = function()
        if vim.bo.filetype == "neo-tree" then
            vim.wo.foldcolumn = "0"
        end
    end,
})

-- format before save
add("BufWritePre", {
    pattern = "*",
    callback = function(args)
        require("conform").format({ bufnr = args.buf })
    end,
})

-- run linter automatically
local lint = require("lint")

add({ "BufWritePost", "InsertLeave" }, {
    group = group("nvim-lint", { clear = true }),
    callback = function()
        if lint.linters_by_ft[vim.bo.filetype] then
            lint.try_lint()
        end
    end,
})
