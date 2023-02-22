require("neo-tree").setup({
  close_if_last_window = true,
  popup_border_style = "rounded",
  enable_git_status = true,
  enable_diagnostics = true,
  source_selector = {
    winbar = true,
    content_layout = "center",
    tab_labels = {
      filesystem = icon["FolderClosed"] .. " File",
      buffers = icon["DefaultFile"] .. " Bufs",
      git_status = icon["Git"] .. " Git",
      diagnostics = icon["Diagnostic"] .. " Diagnostic",
    },
  },
  default_component_configs = {
    container = {
      enable_character_fade = true
    },
    indent = {
      indent_size = 2,
      padding = 0,
      with_markers = false,
      highlight = "NeoTreeIndentMarker",
      with_expanders = true,
      expander_collapsed = "",
      expander_expanded = "",
      expander_highlight = "NeoTreeExpander",
    },
    icon = {
      folder_closed = icon["FolderClosed"],
      folder_open = icon["FolderOpen"],
      folder_empty = icon["FolderEmpty"],
      default = icon["DefaultFile"],
      highlight = "NeoTreeFileIcon"
    },
    git_status = {
      symbols = {
        added = icon["GitAdd"],
        deleted = icon["GitDelete"],
        modified = icon["GitChange"],
        renamed = icon["GitRenamed"],
        untracked = icon["GitUntracked"],
        ignored = icon["GitIgnored"],
        unstaged = icon["GitUnstaged"],
        staged = icon["GitStaged"],
        conflict = icon["GitConflict"],
      },
    },
  },
  window = {
    width = 30,
    mappings = {
      o = "open",
      H = "prev_source",
      L = "next_source",
    },
  },
  filesystem = {
    -- follow_current_file = true,
    hijack_netrw_behavior = "open_current",
    use_libuv_file_watcher = true,
    window = { mappings = { h = "toggle_hidden" } },
  },
  event_handlers = {
    { event = "neo_tree_buffer_enter", handler = function(_) vim.opt_local.signcolumn = "auto" end },
  },
})

