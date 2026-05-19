local M = {}
local languages = { "lua" }

function M.get(tool)
    local N = {}
    for _, lang in ipairs(languages) do
        local lang_tool = require("extras.languages." .. lang).settings()[tool]

        if lang_tool then
            table.insert(N, lang_tool)
        end
    end

    return N
end

function M.get_by_ft(tool)
    local N = {}
    for _, lang in ipairs(languages) do
        local lang_tool = require("extras.languages." .. lang).settings()[tool]
        if lang_tool then
            N[lang] = { lang_tool }
        end
    end

    return N
end

function M.setup_ls(capabilities)
    for _, lang in ipairs(languages) do
        require("extras.languages." .. lang).setup_ls(capabilities)
    end
end

function M.flatten(...)
    local N = {}
    for _, t in ipairs({ ... }) do
        for _, v in ipairs(t) do
            table.insert(N, v)
        end
    end

    return N
end

return M
