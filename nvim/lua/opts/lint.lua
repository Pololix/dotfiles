local M = {}

function M.setup()
    local lint = require("lint")

    lint.linters_by_ft = {
        lua = { "luacheck" },
    }
end

return M
