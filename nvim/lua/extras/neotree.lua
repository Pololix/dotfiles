local M = {}

local def = 3

local renderer = require("neo-tree.ui.renderer")
local filesys = require("neo-tree.sources.filesystem")

function M.mass_toggle(state, root, depth)
    if root.type ~= "directory" then
        return
    end

    depth = (depth and depth > 0) and depth or def
    if root:is_expanded() then
        M.col_recursive(state, root)
        renderer.redraw(state)
    else
        M.exp_recursive(state, root, depth)
    end
end

function M.exp_recursive(state, node, remainder)
    if node.type ~= "directory" or remainder <= 0 then
        return
    end

    if not node:is_expanded() then
        filesys.toggle_directory(state, node, nil, false, false)
    end

    vim.schedule(function()
        local children = state.tree:get_nodes(node:get_id())
        for _, child in ipairs(children) do
            if not vim.startswith(child.name, ".") then
                M.exp_recursive(state, child, remainder - 1)
            end
        end
    end)
end

function M.col_recursive(state, node)
    if node.type ~= "directory" or not node:is_expanded() then
        return
    end

    local children = state.tree:get_nodes(node:get_id())
    for _, child in ipairs(children) do
        M.col_recursive(state, child)
    end

    filesys.toggle_directory(state, node, nil, true, false)
end

return M
