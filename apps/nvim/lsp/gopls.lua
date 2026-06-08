return {
    cmd = {
        "godot",
        "--headless",
        "--path",
        vim.fn.getcwd(),
        "--editor",
    },
    root_dir = function(fname)
        return vim.fs.root(fname, { "project.godot" }) or vim.fn.getcwd()
    end,
    settings = {},
}
