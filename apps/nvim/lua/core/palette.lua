vim.cmd("highlight clear")

if vim.fn.exists("syntax_on") == 1 then
    vim.cmd("syntax reset")
end

vim.g.colors_name = "matugen"

local palette = {
    primary = "#80d4d7",
    on_primary = "#003738",
    primary_container = "#004f52",
    on_primary_container = "#9cf1f4",

    secondary = "#b0cccc",
    on_secondary = "#1b3435",
    secondary_container = "#324b4c",
    on_secondary_container = "#cce8e8",

    tertiary = "#b4c7e9",
    on_tertiary = "#1e314c",
    tertiary_container = "#354763",
    on_tertiary_container = "#d5e3ff",

    background = "#0e1415",
    on_background = "#dde4e3",
    surface = "#0e1415",
    on_surface = "#dde4e3",
    surface_variant = "#3f4949",
    on_surface_variant = "#bec8c8",

    error = "#ffb4ab",
    on_error = "#690005",
    error_container = "#93000a",

    outline = "#899393",
    outline_variant = "#3f4949",
    inverse_surface = "#dde4e3",
    inverse_on_surface = "#2b3232",
    inverse_primary = "#00696c",
    scrim = "#000000",
    shadow = "#000000",
}

return palette
