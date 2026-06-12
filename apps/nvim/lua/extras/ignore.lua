local M = {}

M.neotree = {
    -- project
    "README.md",
    "LICENSE",

    -- lua
    "stylua.toml",
    "lazy-lock.json",

    -- ts
    "@girs",
    "node_modules",
    "tsconfig.json",
    "env.d.ts",
}

M.telescope = {
    -- basic
    "%.cache/",
    "build/",
    "out/",
    "%.o$",
    "%.a$",

    -- project
    ".git/",
    "README%.md$",
    "LICENSE$",

    -- lua
    "stylua%.toml$",
    "lazy%-lock%.json$",

    -- ts
    "@girs/.*",
    "node_modules/.*",
    "tsconfig%.json$",
    "env%.d%.ts$",

    -- other
    "%.json$",
}

return M
