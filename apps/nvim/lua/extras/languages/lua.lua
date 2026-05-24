local M = {}

function M.settings()
    local N = {}

    N.ls = "lua-language-server"
    N.parser = "lua"
    N.formatter = "stylua"
    N.linter = "selene"

    return N
end

function M.setup_ls(capabilities)
    vim.lsp.config("lua_ls", {
        cmd = { "lua-language-server" },
        capabilities = capabilities,

        filetypes = { "lua" },
        root_markers = { ".luarc.json", ".luarc.jsonc", "stylua.toml", ".git" },
        single_file_support = true,

        settings = {
            Lua = {
                runtime = { version = "LuaJIT" },
                workspace = {
                    checkThirdParty = false,
                    library = { vim.env.VIMRUNTIME },
                },
                telemetry = { enable = false },
            },
        },
    })

    vim.lsp.enable("lua_ls")
end

return M
