local icon = {
  ActiveLSP = "",
  ActiveTS = "綠",
  ArrowLeft = "",
  ArrowRight = "",
  BufferClose = "",
  DapBreakpoint = "",
  DapBreakpointCondition = "",
  DapBreakpointRejected = "",
  DapLogPoint = ".>",
  DapStopped = "",
  DefaultFile = "",
  Diagnostic = "裂",
  DiagnosticError = "",
  DiagnosticHint = "",
  DiagnosticInfo = "",
  DiagnosticWarn = "",
  Ellipsis = "…",
  FileModified = "",
  FileReadOnly = "",
  FolderClosed = "",
  FolderEmpty = "",
  FolderOpen = "",
  Git = "",
  GitAdd = "",
  GitBranch = "",
  GitChange = "",
  GitConflict = "",
  GitDelete = "",
  GitIgnored = "◌",
  GitRenamed = "➜",
  GitStaged = "✓",
  GitUnstaged = "✗",
  GitUntracked = "★",
  LSPLoaded = "",
  LSPLoading1 = "",
  LSPLoading2 = "",
  LSPLoading3 = "",
  MacroRecording = "",
  NeovimClose = "", -- TODO v3: remove this icon
  Paste = "",
  Search = "",
  Selected = "❯",
  Spellcheck = "暈",
  TabClose = "",
}

local highlights = {
  Normal = { fg = colors.foreground, bg = colors.background },
  StatusLine = { bg = colors.statusline_bg, fg = colors.foreground },
  StatusLineNC = { bg = colors.statusline_bg, fg = colors.white },
  SignColumn = { bg = colors.background, fg = colors.background },
  MsgArea = { fg = colors.foreground, bg = colors.background },
  ModeMsg = { fg = colors.foreground, bg = colors.background },
  MsgSeparator = { fg = colors.foreground, bg = colors.background },
  SpellBad = { fg = colors.green },
  SpellCap = { fg = colors.cyan },
  SpellLocal = { fg = colors.blue },
  SpellRare = { fg = colors.cyan },
  NormalNC = { fg = colors.foreground, bg = colors.background },
  WildMenu = { fg = colors.white, bg = colors.blue },
  CursorLineNr = { fg = colors.foreground },
  Comment = { fg = colors.comments, italic = true },
  Folded = { fg = colors.blue, bg = colors.background },
  FoldColumn = { fg = colors.blue, bg = colors.background },
  LineNr = { fg = colors.brightBlack, bg = colors.background },
  FloatBorder = { fg = colors.background, bg = colors.background },
  Whitespace = { fg = colors.red },
  VertSplit = { bg = colors.background, fg = colors.black },
  CursorLine = { bg = colors.cursorline },
  CursorColumn = { bg = colors.background },
  ColorColumn = { bg = colors.background },
  NormalFloat = { bg = colors.background },
  Visual = { bg = colors.black, fg = colors.foreground },
  VisualNOS = { bg = colors.background },
  WarningMsg = { fg = colors.yellow, bg = colors.background },
  DiffAdd = { bg = colors.background, fg = colors.green },
  DiffChange = { bg = colors.background, fg = colors.blue },
  DiffDelete = { bg = colors.background, fg = colors.red },
  QuickFixLine = { bg = colors.green },
  MatchParen = { fg = colors.blue, bg = colors.background },
  Cursor = { fg = colors.foreground, bg = colors.cursor },
  lCursor = { fg = colors.foreground, bg = colors.cursor },
  CursorIM = { fg = colors.foreground, bg = colors.cursor },
  TermCursor = { fg = colors.foreground, bg = colors.cursor },
  TermCursorNC = { fg = colors.foreground, bg = colors.cursor },
  Conceal = { fg = colors.blue, bg = colors.background },
  Directory = { fg = colors.blue },
  SpecialKey = { fg = colors.blue },
  Title = { fg = colors.blue },
  ErrorMsg = { fg = colors.red, bg = colors.background },
  Search = { fg = colors.background, bg = colors.brightGreen },
  IncSearch = { fg = colors.background, bg = colors.brightGreen },
  Substitute = { fg = colors.yellow, bg = colors.cyan },
  MoreMsg = { fg = colors.magenta },
  Question = { fg = colors.magenta },
  EndOfBuffer = { fg = colors.background },
  NonText = { fg = colors.red },
  Variable = { fg = colors.magenta },
  String = { fg = colors.green },
  Character = { fg = colors.brightBlue },
  Constant = { fg = colors.magenta },
  Number = { fg = colors.red },
  Boolean = { fg = colors.magenta },
  Float = { fg = colors.magenta },
  Identifier = { fg = colors.magenta },
  Function = { fg = colors.blue },
  Operator = { fg = colors.cyan },
  Type = { fg = colors.magenta },
  StorageClass = { fg = colors.magenta },
  Structure = { fg = colors.cyan },
  Typedef = { fg = colors.cyan },
  Keyword = { fg = colors.magenta, italic = true },
  Statement = { fg = colors.cyan },
  Conditional = { fg = colors.magenta },
  Repeat = { fg = colors.magenta, italic = true },
  Label = { fg = colors.red },
  Exception = { fg = colors.brightRed },
  Include = { fg = colors.magenta },
  PreProc = { fg = colors.blue },
  Define = { fg = colors.blue },
  Macro = { fg = colors.cyan },
  PreCondit = { fg = colors.cyan },
  Special = { fg = colors.cyan },
  SpecialChar = { fg = colors.foreground },
  Tag = { fg = colors.blue },
  Debug = { fg = colors.red },
  Delimiter = { fg = colors.foreground },
  SpecialComment = { fg = colors.comments },
  Ignore = { fg = colors.white, bg = colors.background },
  Todo = { fg = colors.red, bg = colors.background },
  Error = { fg = colors.red, bg = colors.background },
  TabLine = { fg = colors.green, bg = colors.contrast },
  TabLineSel = { fg = colors.foreground, bg = colors.background },
  TabLineFill = { fg = colors.foreground, bg = colors.background },
  
  -- NeoTree 
  NeoTreeTabActive = { sp = colors.blue, underline = true },
  NeoTreeTabInactive = { bg = colors.background },
  NeoTreeCursorLine = { bg = colors.dimblack },
  NeoTreeDimText = { fg = colors.dimblack },
  NeoTreeDirectoryName = { fg = colors.white },
  NeoTreeDirectoryIcon = { fg = colors.blue },
  NeoTreeExpander = { fg = colors.white, bg = 'NONE' },
  NeoTreeWinSeparator = { fg = colors.backgroundDarker },
  NeoTreeNormal = { bg = colors.backgroundDarker },
  NeoTreeNormalNC = { bg = colors.backgroundDarker },
  NeoTreeGitAdded = { fg = colors.green },
  NeoTreeGitConflict = { fg = colors.red },
  NeoTreeGitDeleted = { fg = colors.red },
  NeoTreeGitIgnored = { fg = colors.dimblack },
  NeoTreeGitModified = { fg = colors.yellow },
  NeoTreeGitUnstaged = { fg = colors.cyan },
  NeoTreeGitUntracked = { fg = colors.brightRed },
  NeoTreeGitStaged = { fg = colors.brightGreen },

  -- IndentBlank
  IndentBlanklineSpaceChar = { fg = colors.backgroundLighter, nocombine = true },
  IndentBlanklineChar = { fg = colors.backgroundContrast, nocombine = true },
  IndentBlanklineContextStart = { fg = colors.foreground, underline = true },
  IndentBlanklineContextChar = { fg = "#242931", nocombine = true },
  IndentBlanklineSpaceCharBlankline = { fg = colors.backgroundLighter, nocombine = true },

  -- Treesitter
  ["@comment"] = { fg = colors.comments },
  ["@error"] = { fg = colors.red },
  ["@preproc"] = { fg = colors.magenta },
  ["@define"] = { fg = colors.magenta },
  ["@operator"] = { fg = colors.cyan },

  -- Punctuation
  ["@punctuation.delimiter"] = { fg = colors.cyan },
  ["@punctuation.bracket"] = { fg = colors.cyan },
  ["@punctuation.special"] = { fg = colors.cyan },

  -- Literals
  ["@string"] = { fg = colors.green },
  ["@string.regex"] = { fg = colors.yellow },
  ["@string.escape"] = { fg = colors.yellow },
  ["@string.special"] = { fg = colors.green },

  ["@character"] = { fg = colors.blue },
  ["@character.special"] = { fg = colors.blue },

  ["@boolean"] = { fg = colors.magenta },
  ["@number"] = { fg = colors.red },
  ["@float"] = { fg = colors.red },

  -- Functions
  ["@function"] = { fg = colors.blue },
  ["@function.builtin"] = { fg = colors.blue },
  ["@function.call"] = { fg = colors.blue },
  ["@function.macro"] = { fg = colors.cyan },
  ["@method"] = { fg = colors.blue },

  ["@method.call"] = { fg = colors.blue },

  ["@constructor"] = { fg = colors.yellow },
  ["@parameter"] = { fg = colors.cyan },

  -- Keywords
  ["@keyword"] = { fg = colors.magenta, italic = true },
  ["@keyword.function"] = { fg = colors.magenta, italic = true },
  ["@keyword.operator"] = { fg = colors.magenta },
  ["@keyword.return"] = { fg = colors.magenta, italic = true },

  ["@conditional"] = { fg = colors.magenta, italic = true },
  ["@repeat"] = { fg = colors.magenta, italic = true },
  -- @debug            ; keywords related to debugging
  ["@label"] = { fg = colors.magenta },
  ["@include"] = { fg = colors.magenta, italic = true },
  ["@exception"] = { fg = colors.red, italic = true },

  -- Types

  ["@type"] = { fg = colors.yellow },
  ["@type.builtin"] = { fg = colors.yellow }, -- For builtin types.
  ["@type.definition"] = { fg = colors.cyan }, -- type definitions (e.g. `typedef` in C)
  ["@type.qualifier"] = { fg = colors.magenta }, -- type qualifiers (e.g. `const`)

  ["@storageclass"] = { fg = colors.yellow }, -- visibility/life-time/etc. modifiers (e.g. `static`)
  ["@attribute"] = { fg = colors.blue }, -- attribute annotations (e.g. Python decorators)
  ["@field"] = { fg = colors.cyan }, -- For fields.
  ["@property"] = { fg = colors.cyan }, -- Same as TSField.

  -- Identifiers

  ["@variable"] = { fg = colors.foreground }, -- Any variable name that does not have another highlighcp.
  ["@variable.builtin"] = { fg = colors.yellow }, -- Variable names that are defined by the languages, like this or self.

  ["@constant"] = { fg = colors.yellow }, -- For constants
  ["@constant.builtin"] = { fg = colors.yellow }, -- For constant that are built in the language: nil in Lua.
  ["@constant.macro"] = { fg = colors.red }, -- For constants that are defined by macros: NULL in cp.

  ["@namespace"] = { fg = colors.magenta }, -- For identifiers referring to modules and namespaces.
  ["@symbol"] = { fg = colors.magenta },

  -- Text

  ["@text"] = { fg = colors.foreground }, -- For strings considerated text in a markup language.
  ["@text.strong"] = { fg = colors.foreground }, -- italic
  ["@text.emphasis"] = { fg = colors.cyan },
  ["@text.underline"] = { sp = colors.foreground, undercurl = true }, -- underlined text
  ["@text.strike"] = { fg = colors.foreground }, -- strikethrough text
  ["@text.title"] = { fg = colors.blue }, -- titles like: # Example
  ["@text.literal"] = { fg = colors.cyan },
  ["@text.uri"] = { fg = colors.cyan, undercurl = true }, -- urls, links and emails
  ["@text.math"] = { fg = colors.blue }, -- math environments (e.g. `$ ... $` in LaTeX)
  ["@text.environment"] = { fg = colors.magenta }, -- text environments of markup languages
  ["@text.environment.name"] = { fg = colors.blue }, -- text indicating the type of an environment
  ["@text.reference"] = { fg = colors.magenta }, -- references

  ["@text.todo"] = { bg = colors.yellow }, -- todo notes
  ["@text.note"] = { fg = colors.background, bg = colors.magenta },
  ["@text.warning"] = { fg = colors.background, bg = colors.yellow },
  ["@text.danger"] = { fg = colors.background, bg = colors.red },

  ["@text.diff.add"] = { fg = colors.green }, -- added text (for diff files)
  ["@text.diff.delete"] = { fg = colors.red }, -- deleted text (for diff files)

  -- Tags
  ["@tag"] = { fg = colors.red }, -- Tags like html tag names.
  ["@tag.attribute"] = { fg = colors.blue }, -- Tags like html tag names.
  ["@tag.delimiter"] = { fg = colors.foreground }, -- Tag delimiter like < > /

  -- Language specific:

  -- toml
  ["@property.toml"] = { fg = colors.blue }, -- Differentiates between string and properties

  -- json
  ["@label.json"] = { fg = colors.blue }, -- For labels: label: in C and :label: in Lua.

  -- yaml
  ["@field.yaml"] = { fg = colors.blue }, -- For fields.
}

for group, spec in pairs(highlights) do
  vim.api.nvim_set_hl(0, group, spec)
end

