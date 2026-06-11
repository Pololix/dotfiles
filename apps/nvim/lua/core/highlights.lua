local palette = require("core.palette")
local M = {}

M.ui = {
    Normal = { fg = palette.on_background, bg = palette.background },
    Special = { fg = palette.on_background, bg = palette.background },
    NormalNC = { fg = palette.on_surface_variant, bg = palette.background },

    NormalFloat = { fg = palette.on_surface, bg = palette.surface },
    FloatBorder = { fg = palette.outline, bg = palette.surface },
    FloatTitle = { fg = palette.on_surface, bg = palette.surface, bold = true },
    FloatFooter = { fg = palette.outline, bg = palette.surface },
    WinSeparator = { fg = palette.outline_variant },
    VertSplit = { fg = palette.outline_variant },
    StatusLine = { fg = palette.on_surface, bg = palette.surface_variant },
    StatusLineNC = { fg = palette.outline, bg = palette.surface },

    CursorLine = { bg = palette.surface_variant },
    CursorLineNr = { fg = palette.primary, bg = palette.surface_variant, bold = true },
    CursorColumn = { bg = palette.surface_variant },
    Cursor = { fg = palette.background, bg = palette.on_background },
    CursorIM = { fg = palette.background, bg = palette.on_background },
    TermCursor = { fg = palette.background, bg = palette.on_background },
    TermCursorNC = { fg = palette.background, bg = palette.outline },

    LineNr = { fg = palette.outline },
    SignColumn = { fg = palette.outline, bg = palette.background },
    FoldColumn = { fg = palette.outline, bg = palette.background },
    Folded = { fg = palette.outline, bg = palette.surface_variant, italic = true },
    ColorColumn = { bg = palette.surface_variant },

    Visual = { fg = palette.on_primary, bg = palette.primary },
    Search = { fg = palette.on_primary, bg = palette.primary },
    IncSearch = { fg = palette.on_secondary, bg = palette.secondary },
    MatchParen = { fg = palette.primary, bg = palette.primary_container, bold = true },

    Pmenu = { fg = palette.on_surface, bg = palette.surface },
    PmenuSel = { fg = palette.on_primary_container, bg = palette.primary_container },
    PmenuSbar = { bg = palette.surface_variant },
    PmenuThumb = { bg = palette.primary },
    PmenuKind = { fg = palette.tertiary, bg = palette.surface },
    PmenuKindSel = { fg = palette.tertiary, bg = palette.primary_container },
    PmenuExtra = { fg = palette.outline, bg = palette.surface },
    PmenuExtraSel = { fg = palette.outline, bg = palette.primary_container },
    WildMenu = { fg = palette.on_primary_container, bg = palette.primary_container },

    EndOfBuffer = { fg = palette.outline_variant },
    NonText = { fg = palette.outline_variant },
    SpecialKey = { fg = palette.outline_variant },
    Whitespace = { fg = palette.outline_variant },
    Conceal = { fg = palette.outline },

    MsgArea = { fg = palette.on_surface, bg = palette.background },
    MsgSeparator = { fg = palette.outline, bg = palette.surface },
    MoreMsg = { fg = palette.primary, bold = true },
    Question = { fg = palette.secondary, bold = true },
    ErrorMsg = { fg = palette.error, bold = true },
    WarningMsg = { fg = palette.secondary, bold = true },

    Title = { fg = palette.primary, bold = true },
    Directory = { fg = palette.primary },
    QuickFixLine = { fg = palette.on_primary_container, bg = palette.primary_container, bold = true },

    SpellBad = { undercurl = true, sp = palette.error },
    SpellCap = { undercurl = true, sp = palette.secondary },
    SpellRare = { undercurl = true, sp = palette.tertiary },
    SpellLocal = { undercurl = true, sp = palette.primary },
}

M.syntax = {
    ["@comment"] = { fg = palette.outline, italic = true },
    ["@keyword"] = { fg = palette.secondary, bold = true },

    ["@function"] = { fg = palette.primary },
    ["@function.builtin"] = { fg = palette.primary, italic = true },
    ["@method"] = { fg = palette.primary },
    ["@constructor"] = { fg = palette.on_surface },

    ["@type"] = { fg = palette.tertiary },
    ["@type.builtin"] = { fg = palette.tertiary, italic = true },
    ["@variable"] = { fg = palette.on_surface },
    ["@variable.builtin"] = { fg = palette.secondary, italic = true },
    ["@parameter"] = { fg = palette.on_surface_variant },
    ["@variable.parameter"] = { fg = palette.on_surface_variant },
    ["@property"] = { fg = palette.on_surface },
    ["@field"] = { fg = palette.on_surface },

    ["@constant"] = { fg = palette.tertiary },
    ["@string"] = { fg = palette.tertiary },
    ["@number"] = { fg = palette.tertiary },
    ["@boolean"] = { fg = palette.secondary, bold = true },

    ["@operator"] = { fg = palette.on_surface_variant },
    ["@punctuation"] = { fg = palette.on_surface_variant },

    -- fallback
    Comment = { fg = palette.outline, italic = true },
    Keyword = { fg = palette.secondary, bold = true },

    Function = { fg = palette.primary },

    Type = { fg = palette.tertiary },

    Constant = { fg = palette.tertiary },
    String = { fg = palette.tertiary },
    Number = { fg = palette.tertiary },
    Boolean = { fg = palette.secondary, bold = true },

    Operator = { fg = palette.on_surface_variant },
}

M.diagnostics = {
    DiagnosticError = { fg = palette.error },
    DiagnosticWarn = { fg = palette.secondary },
    DiagnosticInfo = { fg = palette.primary },
    DiagnosticHint = { fg = palette.tertiary },

    DiagnosticUnderlineError = { undercurl = true, sp = palette.error },
    DiagnosticUnderlineWarn = { undercurl = true, sp = palette.secondary },
    DiagnosticUnderlineInfo = { undercurl = true, sp = palette.primary },
    DiagnosticUnderlineHint = { undercurl = true, sp = palette.tertiary },

    DiagnosticVirtualTextError = { fg = palette.error, bg = palette.error_container },
    DiagnosticVirtualTextWarn = { fg = palette.secondary, bg = palette.secondary_container },
    DiagnosticVirtualTextInfo = { fg = palette.primary, bg = palette.primary_container },
    DiagnosticVirtualTextHint = { fg = palette.tertiary, bg = palette.tertiary_container },
}

M.git = {
    DiffAdd = { fg = palette.on_surface, bg = palette.tertiary_container },
    DiffChange = { fg = palette.on_surface, bg = palette.primary_container },
    DiffDelete = { fg = palette.error, bg = palette.error_container },
    DiffText = { fg = palette.on_primary_container, bg = palette.primary_container, bold = true },
    DiffRename = { fg = palette.on_surface, bg = palette.primary_container },

    GitSignsAdd = { fg = palette.tertiary },
    GitSignsChange = { fg = palette.primary },
    GitSignsDelete = { fg = palette.error },
    GitSignsAddNr = { fg = palette.tertiary },

    GitSignsChangeNr = { fg = palette.primary },
    GitSignsDeleteNr = { fg = palette.error },
    GitSignsAddLn = { bg = palette.tertiary_container },
    GitSignsChangeLn = { bg = palette.primary_container },
}

M.plugins = {
    -- neotree
    NeoTreeNormal = { fg = palette.on_surface, bg = palette.surface },
    NeoTreeCursorLine = { bg = palette.surface_variant },

    NeoTreeRootName = { fg = palette.primary, bold = true },
    NeoTreeDirectoryName = { fg = palette.on_surface },
    NeoTreeDirectoryIcon = { fg = palette.primary },
    NeoTreeFileName = { fg = palette.on_surface },

    NeoTreeIndentMarker = { fg = palette.outline_variant },
    NeoTreeExpander = { fg = palette.outline },

    NeoTreeGitAdded = { fg = palette.tertiary },
    NeoTreeGitDeleted = { fg = palette.error },
    NeoTreeGitModified = { fg = palette.primary },
    NeoTreeGitUntracked = { fg = palette.outline },

    -- telescope
    TelescopeNormal = { fg = palette.on_surface, bg = palette.surface },
    TelescopeBorder = { fg = palette.outline, bg = palette.surface },
    TelescopePrompt = { fg = palette.on_surface, bg = palette.surface },
    TelescopeSelection = { fg = palette.on_primary_container, bg = palette.primary_container },

    -- cmp
    CmpNormal = { fg = palette.on_surface, bg = palette.surface },
    CmpBorder = { fg = palette.outline, bg = palette.surface },

    CmpDocumentation = { fg = palette.on_surface, bg = palette.surface },
    CmpDocBorder = { fg = palette.outline, bg = palette.surface },

    CmpItemAbbr = { fg = palette.on_surface },
    CmpItemAbbrMatch = { fg = palette.primary, bold = true },
    CmpItemKind = { fg = palette.tertiary },
    CmpItemMenu = { fg = palette.outline },
    CmpItemSelected = { fg = palette.on_primary_container, bg = palette.primary_container },
}

M.notify = {
    NotifyERROR = { fg = palette.error },
    NotifyWARN = { fg = palette.secondary },
    NotifyINFO = { fg = palette.primary },
    NotifyDEBUG = { fg = palette.tertiary },
    NotifyTRACE = { fg = palette.outline },
}

for _, group in ipairs({ "ui", "syntax", "diagnostics", "git", "plugins", "notify" }) do
    for name, opts in pairs(M[group]) do
        vim.api.nvim_set_hl(0, name, opts)
    end
end
