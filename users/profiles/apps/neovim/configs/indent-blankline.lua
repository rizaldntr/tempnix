require("indent_blankline").setup({
  buftype_exclude = {
    "nofile",
    "terminal",
  },
  filetype_exclude = {
    "help",
    "aerial",
    "alpha",
    "dashboard",
    "neogitstatus",
    "neo-tree",
    "Trouble",
  },
  context_patterns = {
    "class",
    "return",
    "function",
    "method",
    "^if",
    "^while",
    "jsx_element",
    "^for",
    "^object",
    "^table",
    "block",
    "arguments",
    "if_statement",
    "else_clause",
    "try_statement",
    "catch_clause",
    "import_statement",
    "operation_type",
  },
  show_current_context = true,
  show_trailing_blankline_indent = false,
  use_treesitter = true,
  char = "▏",
  context_char = "▏",
})

