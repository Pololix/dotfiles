local M = {}

function M.setup()
    vim.g.lazygit_floating_window_winblend = 0
    vim.g.lazygit_floating_window_scaling_factor = 0.9
    vim.g.lazygit_floating_window_border_chars = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }
    vim.g.lazygit_use_neovim_remote = true
    vim.g.lazygit_use_custom_config_file_path = false
end

return M
