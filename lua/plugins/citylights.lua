return {
  "folke/tokyonight.nvim",
  opts = {
    style = "night",
    transparent = true,

    styles = {
      sidebars = "transparent", -- dark transparent normal
      floats = "transparent",
      statuscolumn = "transparent",
      comments = { italic = true },
      keywords = { italic = true },
    },

    sidebars = { "qf", "help" },

    on_colors = function(c)
      -- real city lights
      -- colors
      c.color1light = "#70E1E8"
      c.color1medium = "#33CED8"
      c.color1dark = "#008B94"
      c.color2light = "#5EC4FF"
      c.color2medium = "#68A1F0"
      c.color2dark = "#539AFC"
      c.color3light = "#E27E8D"
      c.color3medium = "#D95468"
      c.color3dark = "#B62D65"
      c.color4light = "#EBBF83"
      c.color4dark = "#D98E48"
      c.color5light = "#8BD49C"
      c.color6dark = "#718CA1"
      c.color7light = "#8BD49C"
      c.very_light_gray = "#B7C5D3"
      c.light_gray = "#718CA1"
      c.gray = "#41505E"
      c.dark_gray = "#333F4A"
      c.very_dark_gray = "#1D252C"
      c.cyan = c.color1light -- #70E1E8
      c.blue = c.color2light -- #5EC4FF
      c.purple = c.color3dark -- #B62D65
      c.pink = c.color3light -- #E27E8D
      c.yellow = c.color4light -- #EBBF83
      c.green = c.color5light -- #8BD49C
      c.red = c.color3medium -- #D95468
      c.orange = c.color4dark -- #D98E48
      c.light_orange = c.color4light -- #EBBF83
      -- syntax-variables
      c.comment = "#7a597a" -- custom
      c.syntax_text_color = c.very_light_gray
      -- General colors
      c.syntax_text_color = c.very_light_gray
      c.syntax_cursor_color = "#FFFFFF"
      c.syntax_selection_color = "#41505E03" -- c.dark_gray %3
      c.syntax_background_color = c.very_dark_gray
      -- Guide colors
      c.syntax_wrap_guide_color = c.dark_gray
      c.syntax_indent_guide_color = "#28323A"
      c.syntax_invisible_character_color = c.gray
      -- For find and replace markers
      c.syntax_result_marker_color = c.light_gray
      c.syntax_result_marker_color_selected = "#FFFFFF"
      -- Gutter colors
      c.syntax_gutter_text_color = c.light_gray
      c.syntax_gutter_text_color_selected = c.syntax_gutter_text_color
      c.syntax_gutter_background_color = c.very_dark_gray
      c.syntax_gutter_background_color_selected = c.gray
      -- For git diff info. i.e. in the gutter
      c.syntax_color_renamed = c.blue
      c.syntax_color_added = c.green
      c.syntax_color_modified = c.orange
      c.syntax_color_removed = c.red

      -- Map tokyonight color variables to City Lights equivalents
      -- Backgrounds
      c.bg = c.very_dark_gray -- #1D252C
      c.bg_dark = "#171E24"
      c.bg_dark1 = "#0F1519"
      c.bg_float = "#171E24"
      c.bg_highlight = c.dark_gray -- #333F4A  (cursor line)
      c.bg_popup = "#171E24"
      c.bg_sidebar = "#171E24"
      c.bg_statusline = "#171E24"
      c.bg_visual = "#2D3844" -- darken(dark_gray, 3%)
      c.bg_search = c.color2dark -- #539AFC
      c.black = "#0F1519"
      c.border = "#0F1519"
      c.border_highlight = c.color2light
      -- Foregrounds
      c.fg = c.very_light_gray -- #B7C5D3
      c.fg_dark = c.light_gray -- #718CA1
      c.fg_float = c.very_light_gray
      c.fg_gutter = c.gray -- #41505E
      c.fg_sidebar = c.light_gray
      -- Semantic / accent
      c.magenta = c.color1dark -- #008B94
      c.magenta2 = c.color3medium -- #D95468
      c.teal = c.color1medium -- #33CED8
      c.dark3 = c.gray
      c.dark5 = c.light_gray
      c.terminal_black = c.dark_gray
      c.error = c.red
      c.warning = c.yellow
      c.info = c.color1medium
      c.hint = c.color1medium
      c.todo = c.yellow
      -- Blue-family aliases
      c.blue0 = c.color2dark -- #539AFC
      c.blue1 = c.color1medium -- #33CED8
      c.blue2 = c.color2dark
      c.blue5 = c.color2light -- #5EC4FF
      c.blue6 = c.color1light -- #70E1E8
      c.blue7 = c.dark_gray
      -- Green-family aliases
      c.green1 = c.color1light -- #70E1E8
      c.green2 = c.color1medium -- #33CED8
      -- Diff backgrounds
      c.diff.add = "#1A2B1E"
      c.diff.change = "#1A2230"
      c.diff.delete = "#2B1A1E"
      c.diff.text = "#253045"
      -- Git gutter
      c.git.add = c.green
      c.git.change = c.orange
      c.git.delete = c.red
      c.git.ignore = c.gray
      -- Rainbow (use City Lights palette order)
      c.rainbow = { c.color2light, c.yellow, c.green, c.color1medium, c.color3light, c.color1dark, c.orange, c.red }
    end,

    on_highlights = function(hl, c)
      hl.Comment = { fg = c.comment, italic = true } -- comment
      hl.NormalFloat = { bg = c.bg_dark } -- popup
      hl.TelescopeBorder = { fg = "#34424d" } -- Telescope
      hl.TelescopeSelection = { bg = "#28313a" }
      hl["@lsp.typemod.property.declaration.vue"] = { fg = c.very_light_gray }
      hl["@lsp.typemod.variable.declaration.vue"] = { fg = c.very_light_gray }
      hl["@lsp.type.variable.vue"] = { fg = c.light_gray }
      hl["@lsp.mod.readonly.vue"] = { fg = c.light_gray }
      hl["@constant.builtin.typescript"] = { fg = c.red }
      hl["@property.css"] = { fg = c.very_light_gray }

      -- ── Functions ──────────────────────────────────────────────────────────
      hl.Function = { fg = c.color1light }
      hl["@function"] = { fg = c.color1light }
      hl["@function.call"] = { fg = c.color1light }
      hl["@function.method"] = { fg = c.color1light }
      hl["@function.method.call"] = { fg = c.color1light }
      -- support.function → @cyan
      hl["@function.builtin"] = { fg = c.cyan }

      -- ── Strings ────────────────────────────────────────────────────────────
      hl.String = { fg = c.color2medium }
      hl["@string"] = { fg = c.color2medium }
      hl.Character = { fg = c.color2medium }
      hl["@string.regexp"] = { fg = c.cyan }
      hl["@string.escape"] = { fg = c.cyan }
      hl.SpecialChar = { fg = c.cyan }
      hl["@string.documentation"] = { fg = c.yellow }

      -- ── Constants / Numbers ────────────────────────────────────────────────
      hl.Constant = { fg = c.pink }
      hl["@constant"] = { fg = c.pink }
      hl.Number = { fg = c.pink }
      hl.Float = { fg = c.pink }
      hl["@number"] = { fg = c.pink }
      hl["@number.float"] = { fg = c.pink }
      hl.Boolean = { fg = c.pink }
      hl["@constant.builtin"] = { fg = c.green }

      -- -- ── Keywords ───────────────────────────────────────────────────────────
      -- -- .syntax--keyword → @purple (#B62D65)
      hl["@keyword"] = { fg = c.magenta, italic = true } -- 关键字
      -- hl.Keyword                                  = { fg = c.purple, italic = true }
      -- hl["@keyword"]                              = { fg = c.purple, italic = true }
      -- hl["@keyword.return"]                       = { fg = c.purple, italic = true }
      -- -- .syntax--keyword.control / .operator → @color2light (blue)
      -- hl["@keyword.conditional"]                  = { fg = c.blue }
      -- hl["@keyword.repeat"]                       = { fg = c.blue }
      -- hl.Conditional                              = { fg = c.blue }
      -- hl.Repeat                                   = { fg = c.blue }
      -- -- .syntax--storage → @color1dark (#008B94)
      -- hl.StorageClass                             = { fg = c.color1dark }
      -- hl["@keyword.storage"]                      = { fg = c.color1dark }
      -- hl["@keyword.function"]                     = { fg = c.color1dark }
      -- -- Statement / Exception inherit keyword colour
      -- hl.Statement                                = { fg = c.purple }
      -- hl.Exception                                = { fg = c.purple }

      -- -- ── Operators ──────────────────────────────────────────────────────────
      hl.Operator = { fg = c.fg }
      hl["@operator"] = { fg = c.fg }

      -- -- ── Types / Classes ────────────────────────────────────────────────────
      hl.Type = { fg = c.color1medium }
      hl["@type"] = { fg = c.color1medium }
      hl["@type.builtin"] = { fg = c.color1dark }
      hl["@type.definition"] = { fg = c.color1medium }
      hl["@constructor"] = { fg = c.color1medium }
      hl.Identifier = { fg = c.color1medium }
      hl["@property"] = { fg = c.light_gray }

      -- -- ── Variables ──────────────────────────────────────────────────────────
      hl["@variable"] = { fg = c.light_gray }
      hl["@variable.member"] = { fg = c.light_gray }
      hl["@variable.parameter"] = { fg = c.yellow }
      hl["@variable.builtin"] = { fg = c.red }

      -- -- ── Tags ───────────────────────────────────────────────────────────────
      hl["@tag"] = { fg = c.color1dark }
      hl["@tag.attribute"] = { fg = c.color1medium }
      hl["@tag.delimiter"] = { fg = c.light_gray }

      -- -- ── Punctuation ────────────────────────────────────────────────────────
      hl["@punctuation.bracket"] = { fg = c.color2medium }
      hl["@punctuation.delimiter"] = { fg = c.color2medium }
      hl["@punctuation.special"] = { fg = c.color2medium }
      hl.Delimiter = { fg = c.color2medium }

      -- ── Module / Include ───────────────────────────────────────────────────
      hl["@module"] = { fg = c.blue }
      hl.Include = { fg = c.blue }
      hl.PreProc = { fg = c.cyan }
      hl.Define = { fg = c.blue }
      hl.Macro = { fg = c.blue }

      -- ── Markup ─────────────────────────────────────────────────────────────
      hl["@markup.strong"] = { bold = true, fg = c.light_gray }
      hl["@markup.italic"] = { italic = true, fg = c.light_gray }
      hl["@markup.list"] = { fg = c.red }
      hl["@markup.list.markdown"] = { bold = true, fg = c.color2light }
      hl["@markup.link"] = { fg = c.color1light }
      hl["@markup.link.url"] = { fg = c.light_gray }
      hl["@markup.link.markdown_inline"] = { fg = c.light_gray }
      hl["@markup.heading"] = { bold = true, fg = c.blue }
      hl["@markup.heading.1.markdown"] = { bg = "#1A2230", bold = true, fg = c.blue }
      hl["@markup.heading.2.markdown"] = { bg = "#231D1A", bold = true, fg = c.color1light }
      hl["@markup.heading.3.markdown"] = { bg = "#1D2420", bold = true, fg = c.color1medium }
      hl["@markup.heading.4.markdown"] = { bg = "#152026", bold = true, fg = c.color1dark }
      hl["@markup.heading.5.markdown"] = { bg = "#201520", bold = true, fg = c.color2light }
      hl["@markup.heading.6.markdown"] = { bg = "#1E1520", bold = true, fg = c.color2medium }

      -- -- ── Editor UI ──────────────────────────────────────────────────────────
      -- -- Normal
      -- -- hl.Normal                      = { bg = c.bg, fg = c.fg }
      -- -- hl.NormalNC                    = { bg = c.bg, fg = c.fg }
      -- -- hl.NormalFloat                 = { bg = c.bg_float, fg = c.fg }
      -- -- hl.NormalSB                    = { bg = c.bg_sidebar, fg = c.fg_dark }

      -- Cursor: border @color2light (#5EC4FF)
      hl.Cursor = { bg = c.color2light, fg = c.bg }
      hl.CursorIM = { bg = c.color2light, fg = c.bg }
      hl.lCursor = { bg = c.color2light, fg = c.bg }

      hl.CursorLine = { bg = "#232A32" }
      hl.CursorColumn = { bg = "#232A32" }

      hl.Visual = { bg = "#2D3844" }
      hl.VisualNOS = { bg = "#2D3844" }

      hl.Search = { bg = "#535D66", fg = c.fg }
      hl.IncSearch = { bg = c.color2light, fg = c.bg }
      hl.CurSearch = "IncSearch"

      hl.MatchParen = { bg = "#343B41", bold = true, fg = c.blue }

      -- Gutter
      hl.LineNr = { fg = c.gray }
      hl.LineNrAbove = { fg = c.gray }
      hl.LineNrBelow = { fg = c.gray }
      -- hl.CursorLineNr = { bold = true, fg = c.light_gray }
      hl.CursorLineNr = { fg = "#5ec4ff", bold = true }
      hl.FoldColumn = { bg = c.bg, fg = c.light_gray }
      hl.Folded = { bg = c.dark_gray, fg = c.light_gray }
      -- hl.SignColumn = { bg = c.bg, fg = c.gray }
      hl.SignColumn = { bg = "none", fg = c.gray }
      -- hl.SignColumnSB = { bg = c.bg_sidebar, fg = c.gray }
      hl.SignColumnSB = { bg = "none", fg = c.gray }

      -- Indent guides
      -- syntax_indent_guide_color = #28323A
      hl.IblIndent = { fg = "#28323A", nocombine = true }
      hl.IblScope = { fg = c.color1medium, nocombine = true }
      hl.IndentLine = { fg = "#28323A", nocombine = true }
      hl.IndentLineCurrent = { fg = c.color1medium, nocombine = true }
      hl.IndentBlanklineChar = { fg = "#28323A", nocombine = true }
      hl.IndentBlanklineContextChar = { fg = c.color1medium, nocombine = true }

      -- Invisible chars: @gray
      hl.Whitespace = { fg = c.gray }
      hl.NonText = { fg = c.gray }
      hl.SpecialKey = { fg = c.gray }
      hl.EndOfBuffer = { fg = c.bg }
      hl.ColorColumn = { bg = c.dark_gray }

      -- Floats / borders
      hl.FloatBorder = { bg = c.bg_float, fg = c.border_highlight }
      hl.FloatTitle = { bg = c.bg_float, fg = c.border_highlight }

      -- Status / tabline
      hl.StatusLine = { bg = c.bg_statusline, fg = c.fg_dark }
      hl.StatusLineNC = { bg = c.bg_statusline, fg = c.gray }
      hl.TabLine = { bg = c.bg_dark, fg = c.gray }
      hl.TabLineFill = { bg = c.black }
      hl.TabLineSel = { bg = c.blue, fg = c.black }

      -- Pmenu
      hl.Pmenu = { bg = c.bg_popup, fg = c.fg }
      hl.PmenuSel = { bg = "#2D3844" }
      hl.PmenuSbar = { bg = c.bg_dark }
      hl.PmenuThumb = { bg = c.dark_gray }

      -- Window separators
      hl.WinSeparator = { bold = true, fg = c.black }
      hl.VertSplit = { fg = c.black }

      -- ── Diagnostics ────────────────────────────────────────────────────────
      hl.DiagnosticVirtualTextError = { bg = "#2B1A1E", fg = c.red }
      hl.DiagnosticVirtualTextWarn = { bg = "#2B2213", fg = c.yellow }
      hl.DiagnosticVirtualTextInfo = { bg = "#102326", fg = c.color1medium }
      hl.DiagnosticVirtualTextHint = { bg = "#102326", fg = c.color1medium }

      -- ── Diff ───────────────────────────────────────────────────────────────
      hl.DiffAdd = { bg = c.diff.add }
      hl.DiffChange = { bg = c.diff.change }
      hl.DiffDelete = { bg = c.diff.delete }
      hl.DiffText = { bg = c.diff.text }

      -- ── Git gutter ─────────────────────────────────────────────────────────
      hl.GitSignsAdd = { fg = c.git.add }
      hl.GitSignsChange = { fg = c.git.change }
      hl.GitSignsDelete = { fg = c.git.delete }

      -- ── Misc ───────────────────────────────────────────────────────────────
      hl.Special = { fg = c.color1medium }
      hl.Title = { bold = true, fg = c.blue }
      hl.Todo = { bg = c.yellow, fg = c.bg }
      hl.Error = { fg = c.red }
      hl.ErrorMsg = { fg = c.red }
      hl.WarningMsg = { fg = c.yellow }
      hl.Question = { fg = c.blue }
      hl.Directory = { fg = c.blue }
      hl.LspInlayHint = { bg = "#1F2530", fg = c.gray }

      -- Buffer line
      hl.BufferLineFill = { bg = "none" }
      -- inactive buffer tab
      hl.BufferLineBackground = { fg = c.light_gray, bg = "none", italic = false }
      hl.BufferLineNumbers = { fg = c.light_gray, bg = "none" }
      hl.BufferLineCloseButton = { fg = c.light_gray, bg = "none" }
      hl.BufferLineModified = { fg = c.green, bg = "none" }
      hl.BufferLineBufferVisible = { fg = c.fg_dark, bg = "none" }
      hl.BufferLineCloseButtonVisible = { fg = c.fg_dark, bg = "none" }
      hl.BufferLineModifiedVisible = { fg = c.green, bg = "none" }

      -- current buffer
      hl.BufferLineBufferSelected = { fg = c.fg, bg = c.dark_gray, bold = true, italic = true }
      hl.BufferLineNumbersSelected = { fg = c.fg, bg = c.dark_gray }
      hl.BufferLineCloseButtonSelected = { fg = c.red, bg = c.dark_gray }
      hl.BufferLineModifiedSelected = { fg = c.green, bg = c.dark_gray }
      -- thin 细线分隔符
      hl.BufferLineSeparator = { fg = c.dark_gray, bg = "none" }
      hl.BufferLineSeparatorVisible = { bg = c.dark_gray }
      hl.BufferLineSeparatorSelected = { bg = c.dark_gray }
      hl.BufferLineIndicatorSelected = { bg = c.dark_gray }

      -- 右侧 tab 页指示器(1 / 2)
      hl.BufferLineTab = { fg = c.comment, bg = "none" }
      hl.BufferLineTabSelected = { fg = c.fg, bg = "none" }
      hl.BufferLineTabSeparator = { fg = c.bg_dark, bg = "none" }
      hl.BufferLineTabSeparatorSelected = { fg = c.bg_dark, bg = "none" }
      hl.BufferLineTabClose = { fg = c.red, bg = "none" }

      -- tabbar透明LH
      hl.TabLine = { bg = "none" }
      hl.TabLineFill = { bg = "none" }
      hl.StatusLine = { bg = "none" }
      hl.WinBar = { bg = c.dark_gray }
      hl.WinBarNC = { bg = "none" }

      hl.lualine_c_normal = { bg = "none" }
      hl.lualine_c_inactive = { bg = "none" }

      hl.MyWinbar = { fg = c.fg, bg = "none", italic = true }
      hl.TroubleIconFunction = { fg = c.blue, bg = "none" }
      hl.TroubleIconClass = { fg = c.cyan, bg = "none" }
      hl.TroubleIconMethod = { fg = c.green, bg = "none" }

      hl.TroubleNormal = { bg = "none" }
      hl.TroubleNormalNC = { bg = "none" }
      hl.TroubleCount = { fg = c.cyan, bg = "none" }
    end,
  },
}
