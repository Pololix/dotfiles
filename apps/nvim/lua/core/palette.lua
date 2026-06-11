vim.cmd("highlight clear")

if vim.fn.exists("syntax_on") == 1 then
    vim.cmd("syntax reset")
end

vim.g.colors_name = "matugen"

local palette = {
    primary = "#ffb5a0",
    on_primary = "#561f0f",
    primary_container = "#723523",
    on_primary_container = "#ffdbd1",

    secondary = "#e7bdb2",
    on_secondary = "#442a22",
    secondary_container = "#5d4037",
    on_secondary_container = "#ffdbd1",

    tertiary = "#d8c58d",
    on_tertiary = "#3b2f05",
    tertiary_container = "#524619",
    on_tertiary_container = "#f5e1a7",

    background = "#1a110f",
    on_background = "#f1dfda",
    surface = "#1a110f",
    on_surface = "#f1dfda",
    surface_variant = "#53433f",
    on_surface_variant = "#d8c2bc",

    error = "#ffb4ab",
    on_error = "#690005",
    error_container = "#93000a",

    outline = "#a08c87",
    outline_variant = "#53433f",
    inverse_surface = "#f1dfda",
    inverse_on_surface = "#392e2b",
    inverse_primary = "#8f4c38",
    scrim = "#000000",
    shadow = "#000000",
}

return palette
