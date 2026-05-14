local M = {}

function M.counted_expand(state, node, depth)
    if depth <= 0 or node.type ~= "directory" then
        return
    end

    require("neo-tree.sources.filesystem").toggle_directory(state, node, nil, true, false)

    local children = state.tree:get_nodes(node:get_id())
    for _, child in pairs(children) do
        M.counted_expand(state, child, depth - 1)
    end
end

return M
