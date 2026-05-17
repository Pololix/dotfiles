local M = {}

function M.setup()
    require("mason-tool-installer").setup({
        auto_update = false,
        run_on_start = true,
        ensure_installed = {
            -- language servers
            "lua-language-server",
            -- formaters
            "stylua",
            -- linters
            -- debug adapters
        },
    })
end

return M
