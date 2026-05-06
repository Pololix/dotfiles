local add = vim.api.nvim_create_autocmd

-- start treesitter
add("FileType", {
    pattern = { "<filetype>" },
    callback = function()
        vim.treesitter.start()
    end
})

-- 
add({ "BufWinEnter", "WinEnter" }, {
    callback = function()
    if vim.bo.filetype == "neo-tree" then
      vim.wo.foldcolumn = "0"
    end
  end,
})
