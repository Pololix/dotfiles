## 6. blink.cmp
```lua
require("blink.cmp").setup({

  -- ─── KEYMAP ─────────────────────────────────────────────────────────────

  keymap = {
    -- preset applies a full sensible keymap as a starting point.
    -- "default"   → <C-space> show, <CR> accept, <C-e> close,
    --               <C-p>/<C-n> navigate, <C-b>/<C-f> scroll docs
    -- "super-tab" → <Tab> to navigate/accept/jump snippets, very compact
    -- "enter"     → <CR>-centric, nothing on Tab
    -- "none"      → no keys set at all; you define everything below
    preset = "default",

    -- After setting a preset you can add or override individual bindings.
    -- Each value is a list of commands tried left-to-right ("fallback"
    -- means pass the key through to Neovim normally).
    -- Available commands: show, hide, accept, select_next, select_prev,
    --   show_documentation, hide_documentation, scroll_documentation_up,
    --   scroll_documentation_down, snippet_forward, snippet_backward,
    --   cancel, fallback.
    ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
    ["<C-e>"]     = { "hide", "fallback" },
    ["<CR>"]      = { "accept", "fallback" },
    ["<Tab>"]     = { "snippet_forward", "fallback" },
    ["<S-Tab>"]   = { "snippet_backward", "fallback" },
    ["<C-p>"]     = { "select_prev", "fallback" },
    ["<C-n>"]     = { "select_next", "fallback" },
    ["<C-b>"]     = { "scroll_documentation_up", "fallback" },
    ["<C-f>"]     = { "scroll_documentation_down", "fallback" },
  },

  -- ─── APPEARANCE ─────────────────────────────────────────────────────────

  appearance = {
    -- Use nvim-cmp's highlight groups instead of blink's own.
    -- true  → drop-in visual compatibility if you have cmp themes
    -- false → use blink's own highlight groups (recommended)
    use_nvim_cmp_as_default = false,

    -- Controls icon width in the completion menu.
    -- "mono"   → Nerd Font Mono variant icons (fixed-width, no spacing needed)
    -- "normal" → Nerd Font Normal variant (slightly wider, needs padding)
    nerd_font_variant = "mono",

    -- Per-kind icons shown next to each completion item.
    -- Keys are LSP CompletionItemKind names.
    -- Omitting a key falls back to the blink default.
    kind_icons = {
      Text          = "󰉿",
      Method        = "󰆧",
      Function      = "󰊕",
      Constructor   = "",
      Field         = "󰜢",
      Variable      = "󰀫",
      Class         = "󰠱",
      Interface     = "",
      Module        = "",
      Property      = "󰜢",
      Unit          = "󰑭",
      Value         = "󰎠",
      Enum          = "",
      Keyword       = "󰌋",
      Snippet       = "",
      Color         = "󰏘",
      File          = "󰈙",
      Reference     = "󰈇",
      Folder        = "󰉋",
      EnumMember    = "",
      Constant      = "󰏿",
      Struct        = "󰙅",
      Event         = "",
      Operator      = "󰆕",
      TypeParameter = "",
    },
  },

  -- ─── COMPLETION ─────────────────────────────────────────────────────────

  completion = {

    keyword = {
      -- Which characters before the cursor are used to filter completions.
      -- "prefix" → only characters from the cursor back to the word start
      --            (standard behavior — "fo|" filters on "fo")
      -- "full"   → full word including characters after cursor
      --            (useful with ghost text — sees the entire token)
      range = "prefix",
    },

    trigger = {
      -- Start fetching completions as soon as insert mode begins,
      -- before any typing. Reduces latency on the first keypress.
      -- true  → slight background work on every insert
      -- false → wait until you type something
      prefetch_on_insert = false,

      -- Show completions when you type a trigger character defined
      -- by the LSP server (e.g., "." in Python, "::" in Rust).
      show_on_trigger_character = true,

      -- Show completions when inserting *inside* an active snippet.
      show_in_snippet = true,

      -- Characters that suppress the trigger even if they are trigger chars.
      -- Space, newline, and tab prevent accidental completion popups.
      show_on_blocked_trigger_characters = { " ", "\n", "\t" },

      -- Suppress completion after accepting an item on a trigger char.
      -- e.g., accepting "console" doesn't re-trigger on the "e".
      show_on_accept_on_trigger_character = true,

      -- Characters that block completion after they appear before the cursor,
      -- specifically for non-insert events. Prevents popup inside strings.
      show_on_x_blocked_trigger_characters = { "'", '"', "(" },
    },

    list = {
      -- Maximum number of items in the completion list.
      -- Lower values reduce rendering overhead on huge result sets.
      max_items = 200,

      selection = {
        -- Auto-select the first item in the list when it opens.
        -- true  → first item is highlighted immediately (accept with <CR>)
        -- false → nothing is selected; you must press <C-n> first
        preselect = true,

        -- Auto-insert the currently selected item's text as you type.
        -- true  → selected text appears in buffer, replaced as you pick others
        -- false → selection only highlights; text inserted on accept
        auto_insert = true,
      },

      cycle = {
        -- Wrap around when navigating past the last item.
        from_bottom = true,
        -- Wrap around when navigating past the first item.
        from_top = true,
      },
    },

    accept = {
      -- Create a vim undo checkpoint immediately before accepting a completion.
      -- true  → u undoes only the completion, not everything since the last save
      -- false → completion is part of the surrounding undo block
      create_undo_point = true,

      auto_brackets = {
        -- Automatically add brackets "()" after accepting a function completion.
        enabled = true,

        -- The brackets to insert. Most languages use ("(", ")").
        default_brackets = { "(", ")" },

        -- Per-filetype bracket overrides.
        override_brackets_for_filetypes = {},

        -- Try to determine bracket necessity from CompletionItemKind.
        kind_resolution = {
          enabled = true,
          -- JSX/Vue filetypes: don't infer from kind because components
          -- and functions look the same but need different treatment.
          blocked_filetypes = { "typescriptreact", "javascriptreact", "vue" },
        },

        -- Try to determine bracket necessity from semantic tokens
        -- (more accurate than kind, but requires a short async wait).
        semantic_token_resolution = {
          enabled = true,
          blocked_filetypes = {},
          -- Give up on semantic token lookup after this many ms.
          timeout_ms = 400,
        },
      },
    },

    menu = {
      -- Show the completion menu at all.
      enabled = true,

      -- Minimum width of the menu window in columns.
      min_width = 15,

      -- Maximum height of the menu window in rows.
      max_height = 10,

      -- Border style for the completion menu float.
      -- "none"    → no border (most minimal)
      -- "rounded" → rounded corners
      -- "single"  → thin single line
      -- "double"  → double line
      -- "shadow"  → shadow effect
      -- table     → custom 8-char array (same format as nvim_open_win)
      border = "none",

      -- Background transparency. 0 = opaque, 100 = invisible.
      winblend = 0,

      -- Neovim highlight group overrides for the menu window.
      winhighlight = "Normal:BlinkCmpMenu,FloatBorder:BlinkCmpMenuBorder,CursorLine:BlinkCmpMenuSelection,Search:None",

      -- Lines of context visible above/below the selected item.
      scrolloff = 2,

      -- Show a scrollbar on the right when the list is taller than the window.
      scrollbar = true,

      -- Preferred directions for the menu to open relative to the cursor.
      -- "s" = south (below), "n" = north (above).
      -- First element is tried first; falls back to the second if no room.
      direction_priority = { "s", "n" },

      -- Show the menu automatically without pressing a key.
      -- false → menu only appears when you explicitly trigger it (<C-space>)
      auto_show = true,

      draw = {
        -- Column alignment strategy.
        -- "label"  → columns align to the label column
        -- "none"   → no cross-column alignment
        align_to = "label",

        -- Cells of horizontal padding inside each column.
        padding = 1,

        -- Gap (in cells) between columns.
        gap = 1,

        -- Apply treesitter syntax highlighting to completion text
        -- for these source names. Makes previewed code look correct.
        treesitter = { "lsp" },

        -- Column layout: a list of column groups, each a list of component names.
        -- Components are rendered left-to-right within a column group.
        -- Built-in components: "kind_icon", "kind", "label",
        --   "label_description", "source_name"
        columns = {
          { "kind_icon" },
          { "label", "label_description", gap = 1 },
          { "kind" },
        },
      },
    },

    documentation = {
      -- Show documentation automatically when an item is selected.
      -- false → only on explicit key (show_documentation command)
      auto_show = true,

      -- Delay in ms before showing documentation after item selection.
      -- Prevents flickering when quickly scrolling through items.
      auto_show_delay_ms = 500,

      -- How quickly to re-render documentation when it changes.
      update_delay_ms = 50,

      -- Use treesitter to syntax-highlight documentation content.
      treesitter_highlighting = true,

      window = {
        min_width = 10,
        max_width = 60,
        max_height = 20,
        border = "padded",  -- same values as menu.border; "padded" adds margin
        winblend = 0,
        scrollbar = true,
        -- Preferred directions for the doc window relative to the menu.
        -- "e" = east (right), "w" = west (left), then "s"/"n" fallbacks.
        direction_priority = { "e", "w", "s", "n" },
      },
    },

    ghost_text = {
      -- Show the top completion item as greyed-out inline text
      -- (like GitHub Copilot's suggestions).
      -- true  → visually shows what <CR> would insert
      -- false → no inline hint (default, cleaner)
      enabled = false,
    },
  },

  -- ─── SOURCES ────────────────────────────────────────────────────────────

  sources = {
    -- Which sources to query by default (ordered by priority).
    -- Built-in: "lsp", "path", "snippets", "buffer"
    default = { "lsp", "path", "snippets", "buffer" },

    -- Override sources for specific filetypes.
    per_filetype = {
      -- sql = { "dadbod", "buffer" },
    },

    -- Sources active on the : command line. Empty list = no completion there.
    cmdline = {},

    -- Transform or filter all items before ranking.
    -- items: list of completion items. Return the modified list.
    transform_items = function(ctx, items)
      return items
    end,

    -- Do not show completions until this many characters are typed.
    -- 0 → show immediately (recommended with LSP)
    -- 2 → avoids short noise words from the buffer source
    min_keyword_length = 0,

    providers = {
      lsp = {
        name = "LSP",
        module = "blink.cmp.sources.lsp",
        enabled = true,
        -- Transform items from this source specifically.
        transform_items = nil,
        -- Max items from this source.
        max_items = nil,
        -- Minimum keyword length before this source fires.
        min_keyword_length = 0,
        -- Sources to fall back to when this one returns nothing.
        -- "buffer" ensures you still get completions with no LSP.
        fallbacks = { "buffer" },
        -- Add to item scores from this source (higher = appears first).
        score_offset = 0,
      },

      path = {
        module = "blink.cmp.sources.path",
        score_offset = 3,
        opts = {
          -- Include a trailing / after directory completions.
          trailing_slash = false,
          -- Show the trailing / in the label (visual only).
          label_trailing_slash = true,
          -- Function returning the root from which paths are resolved.
          get_cwd = function(context)
            return vim.fn.expand(("%:p:h"):format(context.bufnr))
          end,
          -- Show dotfiles in path completions.
          show_hidden_files_by_default = false,
        },
      },

      snippets = {
        module = "blink.cmp.sources.snippets",
        -- Negative offset pushes snippets below LSP/path in rankings.
        score_offset = -3,
        opts = {
          -- Load snippets from the friendly-snippets package if installed.
          friendly_snippets = true,
          -- Directories to scan for your own .json/.code-snippets snippet files.
          search_paths = { vim.fn.stdpath("config") .. "/snippets" },
          -- Snippet scopes treated as global (available in all filetypes).
          global_snippets = { "all" },
          extended_filetypes = {},
          ignored_filetypes = {},
        },
      },

      buffer = {
        module = "blink.cmp.sources.buffer",
        opts = {
          -- Which buffers contribute words to completion.
          -- Default: only the current buffer.
          -- To include all visible buffers:
          -- get_bufnrs = function() return vim.api.nvim_list_bufs() end
          get_bufnrs = function()
            return { vim.api.nvim_get_current_buf() }
          end,
        },
      },
    },
  },

  -- ─── SNIPPETS ───────────────────────────────────────────────────────────

  snippets = {
    -- Which snippet engine to use.
    -- "default"       → Neovim's built-in vim.snippet (no extra plugin needed)
    -- "luasnip"       → use LuaSnip (requires luasnip plugin)
    -- "mini_snippets" → use mini.snippets
    preset = "default",
  },

  -- ─── FUZZY ──────────────────────────────────────────────────────────────

  fuzzy = {
    -- Whether to use the Rust binary for fuzzy matching.
    -- "prefer_rust" → use Rust if available, fall back to Lua
    -- "lua"         → always use pure Lua (slower, no compilation needed)
    implementation = "prefer_rust",

    prebuilt_binaries = {
      -- Automatically download a prebuilt Rust binary on first launch.
      -- true  → convenient, requires internet on first setup
      -- false → you must compile blink yourself (nix, air-gapped systems)
      download = true,

      -- Pin to a specific blink.cmp release tag.
      -- nil → always download the version matching your installed blink.cmp
      force_version = nil,

      -- Override the target triple used for binary lookup.
      -- nil → auto-detect from the system
      -- e.g. "x86_64-unknown-linux-gnu"
      force_system_triple = nil,
    },

    -- Allow fuzzy matches even when one character differs from the query.
    -- true  → "functoin" still matches "function" (tolerant)
    -- false → exact prefix/subsequence matching only
    use_typo_resistance = true,

    -- Boost items you have accepted recently or frequently.
    -- Creates a personalized ranking over time.
    use_frecency = true,

    -- Boost items defined near your cursor position in the same buffer.
    use_proximity = true,

    -- Tiebreaker ordering when scores are equal.
    -- "label"  → alphabetical
    -- "kind"   → CompletionItemKind (Snippet before Text, etc.)
    -- "score"  → fuzzy score (usually the primary sort; listed last = lowest priority)
    sorts = { "label", "kind", "score" },
  },

  -- ─── SIGNATURE HELP ─────────────────────────────────────────────────────

  signature = {
    -- Show function signature help when typing arguments.
    -- Requires the LSP server to support textDocument/signatureHelp.
    -- false → disabled (saves screen space; use hover instead)
    -- true  → automatic signature popup as you type "(" etc.
    enabled = false,

    trigger = {
      -- Characters that re-trigger signature help (e.g. "," for next arg).
      blocked_trigger_characters = {},
      blocked_retrigger_characters = {},
    },

    window = {
      min_width = 1,
      max_width = 100,
      max_height = 10,
      border = "padded",
      winblend = 0,
      scrollbar = false,
      direction_priority = { "n", "s" },
      -- Apply treesitter highlighting to signature content.
      treesitter_highlighting = true,
    },
  },
})
```

---

## 7. nvim-autopairs (minor)

### Problem it solves

When you type `(`, `[`, `{`, `"`, or `` ` ``, it inserts the matching closing character and positions the cursor inside the pair. It also handles backspace (deletes both characters), `<CR>` inside pairs (opens with proper indentation), and skips past an existing closing character instead of doubling it.

### Configuration

```lua
require("nvim-autopairs").setup({

  -- Use treesitter to determine whether the cursor is inside a string
  -- or comment, and suppress pairing there if desired.
  -- true  → smarter pairing (recommended)
  -- false → pair everywhere unconditionally
  check_ts = true,

  -- Per-filetype treesitter nodes where pairing is suppressed.
  -- Keys: filetype. Values: list of treesitter node type strings.
  ts_config = {
    lua        = { "string", "source" },
    javascript = { "string", "template_string" },
    python     = { "string" },
  },

  -- Filetypes where autopairs is entirely disabled.
  disable_filetype = { "TelescopePrompt", "spectre_panel", "snacks_picker_input" },

  -- Suppress pairing when recording or executing a macro.
  -- true  → macros stay clean and predictable
  -- false → pairs are inserted during macro playback
  disable_in_macro = true,

  -- Suppress pairing in visual-block mode.
  disable_in_visualblock = false,

  -- Suppress pairing in replace mode (R key).
  disable_in_replace_mode = true,

  -- Pattern: if the character immediately after the cursor matches,
  -- do not insert a closing pair (the existing one will be used).
  -- Default covers word chars, quotes, brackets, backticks, dollar signs.
  -- Values: Lua pattern string.
  ignored_next_char = [=[[%w%%%'%[%"%.%`%$]]=],

  -- Move the cursor past an existing closing character instead of
  -- inserting a new one (e.g., if ")" is already there, typing ")"
  -- moves past it rather than inserting a second one).
  enable_moveright = true,

  -- When typing a closing quote at the end of a string, auto-add
  -- a space and opening bracket (e.g., `"str" (`).
  -- Useful in some coding styles; disable if it feels intrusive.
  enable_afterquote = true,

  -- Prevent inserting a closing pair when an unmatched closing bracket
  -- already exists on the same line (avoids double-closing).
  enable_check_bracket_line = true,

  -- Allow inserting brackets inside quotes.
  enable_bracket_in_quote = true,

  -- Use vim abbreviations as a source for pairing rules (rare use case).
  enable_abbr = false,

  -- Create a vim undo checkpoint before inserting a pair.
  -- true  → u undoes the pair insertion independently
  -- false → pair is part of the surrounding undo block
  break_undo = true,

  -- Map <CR> to close pairs and re-indent when pressed between an open
  -- and close bracket on the same line (e.g., "{|}").
  -- true  → standard brace-and-indent behavior
  -- false → let another plugin or your own mapping handle <CR>
  -- NOTE: if blink.cmp's <CR> mapping conflicts, disable one of them.
  map_cr = true,

  -- Map <BS> to delete both characters of a pair when the cursor is
  -- between them (e.g., "(|)" → backspace → "").
  map_bs = true,

  -- Map <C-h> to behave like backspace (same effect as map_bs).
  -- false → leave <C-h> alone (default terminal behavior)
  map_c_h = false,

  -- Map <C-w> to delete an entire pair word.
  map_c_w = false,
})
```

---

## 8. nvim-ufo

### Problem it solves

Neovim's built-in folding (`:set foldmethod=...`) has four options: manual, indent, syntax, and expr. Syntax folding is slow and often wrong. Indent folding is fast but dumb. LSP servers and treesitter both understand the actual structure of code and can provide accurate fold ranges — but the built-in system cannot consume them. nvim-ufo bridges this gap and adds a virtual text preview of folded content on the fold line itself.

### Why this one

It is the only mature plugin that uses the LSP `textDocument/foldingRange` request (the most accurate source of fold ranges), falls back to treesitter, then falls back to indent, all transparently. The fold preview float and customizable virtual text separator are unique to it.

### Prerequisites

```lua
-- These vim options are required before calling ufo.setup():
vim.o.foldcolumn     = "1"   -- shows fold indicators in the sign column
                               -- "0" hides it, "auto:9" auto-sizes up to 9
vim.o.foldlevel      = 99    -- open all folds by default (high number = open)
vim.o.foldlevelstart = 99    -- same, for newly opened buffers
vim.o.foldenable     = true  -- must be true or folds are never computed
```

### Configuration

```lua
require("ufo").setup({

  -- Function that returns which fold providers to use for a given buffer.
  -- Called once per buffer when it is first folded.
  -- Arguments: bufnr (integer), filetype (string), buftype (string)
  -- Return values:
  --   "lsp"        → use LSP foldingRange (most accurate, requires server support)
  --   "treesitter" → use treesitter folds (fast, no LSP needed)
  --   "indent"     → use indentation level (fastest, least accurate)
  --   ""           → fall back to Neovim built-in (foldmethod option)
  --   { primary, fallback } → try primary; if it provides no ranges, use fallback
  provider_selector = function(bufnr, filetype, buftype)
    local lsp_with_ts_fallback = { "lsp", "treesitter" }
    local ts_with_indent_fallback = { "treesitter", "indent" }
    local ft_map = {
      python     = lsp_with_ts_fallback,
      typescript = lsp_with_ts_fallback,
      javascript = lsp_with_ts_fallback,
      lua        = ts_with_indent_fallback,  -- lua_ls fold support is weak
      markdown   = { "treesitter", "indent" },
    }
    return ft_map[filetype] or lsp_with_ts_fallback
  end,

  -- Milliseconds to briefly highlight a fold after you open it
  -- (so you can see where you are in the file).
  -- 0     → disable the highlight entirely
  -- 400   → a gentle 400ms flash
  open_fold_hl_timeout = 400,

  -- Automatically close these fold kinds when a buffer is opened.
  -- Useful for collapsing import blocks and long comments by default.
  -- "default" applies to all filetypes not listed explicitly.
  -- Valid kind strings come from the LSP server (they vary by language):
  -- common values: "imports", "comment", "region", "array", "object"
  close_fold_kinds_for_ft = {
    default = { "imports", "comment" },
    json    = { "array" },
  },

  -- Custom function to render the virtual text shown on a closed fold line.
  -- Return a list of { text, highlight_group } chunks (same format as
  -- nvim_buf_set_extmark's virt_text field).
  -- virtText: the existing chunks from the first line of the fold
  -- lnum:     the line number of the fold start (0-indexed)
  -- endLnum:  the line number of the fold end (0-indexed)
  -- width:    available width in the window
  -- truncate: function(str, max_width) → truncated string (provided by ufo)
  fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate)
    local newVirtText = {}
    local suffix = ("  ↙ %d lines"):format(endLnum - lnum)
    local sufWidth = vim.fn.strdisplaywidth(suffix)
    local targetWidth = width - sufWidth
    local curWidth = 0

    for _, chunk in ipairs(virtText) do
      local chunkText = chunk[1]
      local chunkWidth = vim.fn.strdisplaywidth(chunkText)
      if targetWidth > curWidth + chunkWidth then
        table.insert(newVirtText, chunk)
      else
        chunkText = truncate(chunkText, targetWidth - curWidth)
        table.insert(newVirtText, { chunkText, chunk[2] })
        chunkWidth = vim.fn.strdisplaywidth(chunkText)
        if curWidth + chunkWidth < targetWidth then
          suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
        end
        break
      end
      curWidth = curWidth + chunkWidth
    end

    table.insert(newVirtText, { suffix, "MoreMsg" })
    return newVirtText
  end,

  -- Expose the fold virtual text handler to the peek/preview float.
  -- Only needed if you are building custom integrations on top of ufo.
  enable_get_fold_virt_text = false,

  preview = {
    win_config = {
      -- Border of the fold preview floating window.
      -- Same values as nvim_open_win border.
      border = "rounded",

      -- Transparency of the preview float.
      winblend = 12,

      -- Highlight overrides for the preview float.
      winhighlight = "Normal:Normal",
    },

    -- Keymaps active while a fold preview is visible.
    mappings = {
      scrollU  = "<C-u>",   -- scroll preview up
      scrollD  = "<C-d>",   -- scroll preview down
      jumpTop  = "[",       -- jump cursor to top of preview
      jumpBot  = "]",       -- jump cursor to bottom of preview
    },
  },
})

-- Suggested keymaps:
vim.keymap.set("n", "zR", require("ufo").openAllFolds,   { desc = "Open all folds" })
vim.keymap.set("n", "zM", require("ufo").closeAllFolds,  { desc = "Close all folds" })
vim.keymap.set("n", "zr", require("ufo").openFoldsExceptKinds, { desc = "Fold less" })
vim.keymap.set("n", "zm", require("ufo").closeFoldsWith, { desc = "Fold more" })
vim.keymap.set("n", "K", function()
  local winid = require("ufo").peekFoldedLinesUnderCursor()
  if not winid then vim.lsp.buf.hover() end
end, { desc = "Peek fold or hover" })
```

---

## 9. toggleterm.nvim (minor)

### Problem it solves

Neovim has a built-in terminal (`:term`), but it gives you no way to toggle a terminal buffer in and out of view while preserving its process state, manage multiple named terminals, or open them in floats or splits with consistent sizing. toggleterm.nvim wraps all of this: toggle a persistent terminal with one key, choose its direction (float, horizontal split, vertical split, new tab), and define named terminals for specific tools (lazygit, htop, etc.).

### Why this one

- **vim-floaterm**: float-only, older codebase, less Lua-native.
- **toggleterm**: supports all directions, multi-terminal, named terminal types, and exposes a clean Lua API for custom terminals. Actively maintained.

### Configuration

```lua
require("toggleterm").setup({

  -- Height of horizontal split terminals, or width of vertical splits.
  -- Can be a fixed integer (e.g. 15 lines) or a function receiving the
  -- terminal object and returning a number.
  size = function(term)
    if term.direction == "horizontal" then
      return 15
    elseif term.direction == "vertical" then
      return math.floor(vim.o.columns * 0.4)
    end
  end,

  -- Global keymap to toggle the default terminal (terminal #1).
  -- Works in normal, insert, and terminal modes (see insert_mappings,
  -- terminal_mappings below).
  open_mapping = [[<C-\>]],

  -- Callbacks fired at specific terminal lifecycle events.
  -- t is the Terminal object (t.id, t.direction, t.name, t.bufnr, etc.)
  on_create = function(t) end,  -- terminal buffer created
  on_open   = function(t) end,  -- window opened (may be multiple times)
  on_close  = function(t) end,  -- window hidden (process still running)
  on_stdout = function(t, job, data, name) end,
  on_stderr = function(t, job, data, name) end,
  on_exit   = function(t, job, exit_code, name) end,

  -- Hide line numbers in terminal buffers.
  -- true → cleaner terminal appearance (recommended)
  hide_numbers = true,

  -- Automatically change the terminal's working directory to match
  -- Neovim's current working directory when opened.
  -- false → terminal keeps its original cwd
  -- true  → terminal follows :cd changes
  autochdir = false,

  -- Apply a slight background shading to terminal windows so they
  -- look distinct from editor splits.
  shade_terminals = true,

  -- How much to shade (darken or lighten) the terminal background.
  -- Negative values darken; positive values lighten.
  -- Typical range: -50 (quite dark) to 50 (quite light).
  shading_factor = "-30",

  -- Enter insert mode automatically when a terminal window opens.
  -- true  → you can start typing immediately
  -- false → stays in normal mode (useful for scrolling output)
  start_in_insert = true,

  -- Apply open_mapping in insert mode.
  insert_mappings = true,

  -- Apply open_mapping in terminal mode (while inside a terminal).
  terminal_mappings = true,

  -- Remember the size of the terminal window between toggles.
  -- true  → resizing is preserved across hide/show cycles
  -- false → always opens at the configured size
  persist_size = true,

  -- Remember whether the terminal was in insert or normal mode
  -- when it was last hidden, and restore that mode on next open.
  persist_mode = true,

  -- Default direction for new terminals.
  -- "float"      → floating window (most popular for quick tasks)
  -- "horizontal" → horizontal split at the bottom
  -- "vertical"   → vertical split on the right
  -- "tab"        → new tab
  direction = "float",

  -- Close the terminal window when the process exits.
  -- true  → window disappears when the shell exits
  -- false → buffer stays open showing "[Process exited 0]"
  close_on_exit = true,

  -- Start the terminal with a clean environment (no inherited variables).
  -- false → inherits your shell environment (normal behavior)
  -- true  → useful for debugging environment issues
  clear_env = false,

  -- Shell to use for terminal buffers.
  -- Defaults to vim.o.shell (your $SHELL).
  -- Override per-terminal via Terminal:new({ cmd = "fish" })
  shell = vim.o.shell,

  -- Automatically scroll to the bottom when new output arrives.
  -- true  → always shows latest output
  -- false → lets you scroll back without being yanked to the bottom
  auto_scroll = true,

  -- Configuration for floating terminal windows.
  float_opts = {
    -- Border style: "single", "double", "shadow", "curved",
    -- or a custom 8-element char array.
    border = "curved",

    -- Width of the float as an integer (columns) or a function() returning one.
    width = function()
      return math.floor(vim.o.columns * 0.85)
    end,

    -- Height of the float as an integer (lines) or a function() returning one.
    height = function()
      return math.floor(vim.o.lines * 0.85)
    end,

    -- Transparency: 0 = opaque, 100 = invisible.
    winblend = 0,

    -- Z-index (stacking order relative to other floats).
    zindex = 1,

    -- Where to display the window title (if terminal has a name).
    -- "left" | "center" | "right"
    title_pos = "center",
  },

  -- Show a winbar at the top of each terminal listing all open terminal IDs.
  winbar = {
    enabled = false,
    name_formatter = function(term)
      return term.name
    end,
  },
})

-- Custom named terminals (defined outside setup, e.g. in keymaps.lua):
local Terminal = require("toggleterm.terminal").Terminal

-- Example: a dedicated lazygit terminal (if you're not using lazygit.nvim)
local lazygit = Terminal:new({
  cmd       = "lazygit",
  dir       = "git_dir",       -- open in the git root of the current file
  direction = "float",
  hidden    = true,            -- don't include in the numbered toggle cycle
  on_open   = function(term)
    vim.cmd("startinsert!")
    -- close lazygit with q inside it
    vim.api.nvim_buf_set_keymap(
      term.bufnr, "t", "q", "<cmd>close<CR>", { noremap = true, silent = true }
    )
  end,
})
vim.keymap.set("n", "<leader>G", function() lazygit:toggle() end,
  { desc = "Toggle LazyGit terminal" })
```

---

## Wiring it all together

The order that matters in your lazy.nvim spec:

```
mason  →  mason-tool-installer  →  lspconfig  →  blink.cmp
                                               ↘  conform + nvim-lint
```

blink.cmp must load before lspconfig so that `blink.cmp.get_lsp_capabilities()` is available when you call each server's `setup()`. mason-tool-installer must run before lspconfig tries to attach to the first buffer, so use `event = "VeryLazy"` or ensure mason-tool-installer has a higher priority.

```lua
-- In your lazy.nvim plugin specs:
{
  "saghen/blink.cmp",
  lazy = false,       -- load immediately so capabilities are ready
  priority = 100,
},
{
  "neovim/nvim-lspconfig",
  dependencies = {
    "saghen/blink.cmp",
    "williamboman/mason-tool-installer.nvim",
  },
  event = { "BufReadPre", "BufNewFile" },
},
{
  "stevearc/conform.nvim",
  event = "BufWritePre",
},
{
  "mfussenegger/nvim-lint",
  event = { "BufReadPost", "BufWritePost" },
},
```
