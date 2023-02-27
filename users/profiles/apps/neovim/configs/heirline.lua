local utils = require("heirline.utils")
local conditions = require("heirline.conditions")

local heirline_colors = {
  bg = colors.background,
  bg_darker = colors.backgroundDarker,
  comments = colors.comments,
  fg = colors.foreground,
  black = colors.black,
  red = colors.red,
  green = colors.green,
  yellow = colors.yellow,
  blue = colors.blue,
  magenta = colors.magenta,
  cyan = colors.cyan,
  git_add = colors.green,
  git_change = colors.yellow,
  git_del = colors.red,
}
require('heirline').load_colors(heirline_colors)

local Space = { provider = " " }
local ViMode = {
  init = function(self)
    self.mode = vim.fn.mode(1)

    if not self.once then
      vim.api.nvim_create_autocmd("ModeChanged", {
          pattern = "*:*o",
          command = 'redrawstatus'
      })
      self.once = true
    end
  end,
  static = {
    mode_names = {
      n = "N",
      no = "N?",
      nov = "N?",
      noV = "N?",
      ["no\22"] = "N?",
      niI = "Ni",
      niR = "Nr",
      niV = "Nv",
      nt = "Nt",
      v = "V",
      vs = "Vs",
      V = "V_",
      Vs = "Vs",
      ["\22"] = "^V",
      ["\22s"] = "^V",
      s = "S",
      S = "S_",
      ["\19"] = "^S",
      i = "I",
      ic = "Ic",
      ix = "Ix",
      R = "R",
      Rc = "Rc",
      Rx = "Rx",
      Rv = "Rv",
      Rvc = "Rv",
      Rvx = "Rv",
      c = "C",
      cv = "Ex",
      r = "...",
      rm = "M",
      ["r?"] = "?",
      ["!"] = "!",
      t = "T",
    },
    mode_colors = {
      n = "red" ,
      i = "green",
      v = "cyan",
      V =  "cyan",
      ["\22"] =  "cyan",
      c =  "magenta",
      s =  "yellow",
      S =  "yellow",
      ["\19"] =  "yellow",
      R =  "blue",
      r =  "blue",
      ["!"] =  "red",
      t =  "red",
    }
  },
  provider = function(self)
      return "󰊠 %1("..self.mode_names[self.mode].."%)"
  end,
  hl = function(self)
      local mode = self.mode:sub(1, 1)
      return { fg = self.mode_colors[mode], bold = true, }
  end,
  update = {
      "ModeChanged",
  },
}

local Git = {
  condition = conditions.is_git_repo,

  init = function(self)
      self.status_dict = vim.b.gitsigns_status_dict
      self.has_changes = self.status_dict.added ~= 0 or self.status_dict.removed ~= 0 or self.status_dict.changed ~= 0
  end,

  hl = { fg = "fg" },

  {   -- git branch name
      provider = function(self)
          return " " .. self.status_dict.head
      end,
  },
  -- You could handle delimiters, icons and counts similar to Diagnostics
  {
      condition = function(self)
          return self.has_changes
      end,
      provider = "("
  },
  {
      provider = function(self)
          local count = self.status_dict.added or 0
          return count > 0 and ("+" .. count)
      end,
      hl = { fg = "git_add" },
  },
  {
      provider = function(self)
          local count = self.status_dict.removed or 0
          return count > 0 and ("-" .. count)
      end,
      hl = { fg = "git_del" },
  },
  {
      provider = function(self)
          local count = self.status_dict.changed or 0
          return count > 0 and ("~" .. count)
      end,
      hl = { fg = "git_change" },
  },
  {
      condition = function(self)
          return self.has_changes
      end,
      provider = ")",
  },
}

-- I take no credits for this! :lion:
local ScrollBar ={
  static = {
      sbar = { '▁', '▂', '▃', '▄', '▅', '▆', '▇', '█' }
  },
  provider = function(self)
      local curr_line = vim.api.nvim_win_get_cursor(0)[1]
      local lines = vim.api.nvim_buf_line_count(0)
      local i = math.floor((curr_line - 1) / lines * #self.sbar) + 1
      return string.rep(self.sbar[i], 2)
  end,
  hl = { fg = "blue" },
}

local FileType = {
  condition = function(self)
    local filename = vim.api.nvim_buf_get_name(self.bufnr or 0)
    return filename ~= "" and filename ~= "neo-tree"
  end,
  init = function(self)
    self.filename = vim.api.nvim_buf_get_name(self.bufnr or 0)
    self.extension = vim.fn.fnamemodify(self.filename, ":e")
    self.filetype = vim.bo[self and self.bufnr or 0].filetype
    self.icon, self.icon_color = require("nvim-web-devicons").get_icon_color(self.filename, self.extension, { default = true })
  end,
  {
    provider = function(self)
      return self.icon .. " "
    end,
    hl = function(self)
      return { fg = self.icon_color }
    end
  },
  {
    provider = function(self)
      return self.filetype
    end,
    hl = { fg = "fg" },
  }
}

local GitDiff = {
  condition = conditions.is_git_repo,
  init = function(self)
      self.status_dict = vim.b.gitsigns_status_dict
      self.has_changes = self.status_dict.added ~= 0 or self.status_dict.removed ~= 0 or self.status_dict.changed ~= 0
  end,
  {
    condition = function(self)
      local count = self.status_dict.added or 0
      return count > 0
    end,
    provider = function(self)
      return icon.GitAdd .. " " .. self.status_dict.added .. " "
    end,
    hl = { fg = "green" }
  },
  {
    condition = function(self)
      local count = self.status_dict.changed or 0
      return count > 0
    end,
    provider = function(self)
      return icon.GitChange .. " " .. self.status_dict.changed .. " "
    end,
    hl = { fg = "yellow" }
  },
  {
    condition = function(self)
      local count = self.status_dict.removed or 0
      return count > 0
    end,
    provider = function(self)
      return icon.GitDelete .. " " .. self.status_dict.removed .. " "
    end,
    hl = { fg = "red" }
  },
}

local Diagnostics = {

  condition = conditions.has_diagnostics,

  static = {
      error_icon = icon.DiagnosticError,
      warn_icon = icon.DiagnosticWarn,
      info_icon = icon.DiagnosticInfo,
      hint_icon = icon.DiagnosticHint,
  },

  init = function(self)
      self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
      self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
      self.hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
      self.info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
  end,
  update = { "DiagnosticChanged", "BufEnter" },
  {
      provider = function(self)
          return self.errors > 0 and (self.error_icon .. " " .. self.errors .. " ")
      end,
      hl = { fg = "red" },
  },
  {
      provider = function(self)
          return self.warnings > 0 and (self.warn_icon .. " " .. self.warnings .. " ")
      end,
      hl = { fg = "yellow" },
  },
  {
      provider = function(self)
          return self.info > 0 and (self.info_icon .. " " .. self.info .. " ")
      end,
      hl = { fg = "blue" },
  },
  {
      provider = function(self)
          return self.hints > 0 and (self.hint_icon .. " " .. self.hints)
      end,
      hl = { fg = "cyan" },
  },
}

local LSPProgress = {
  provider = function(self)
    local Lsp = vim.lsp.util.get_progress_messages()[1]
    if not Lsp then return "" end

    local function escape(str) return string.gsub(str, "%%2F", "/") end
    return string.format(
      " %%<%s %s %s (%s%%%%) ",
      icon["LSP" .. ((Lsp.percentage or 0) >= 70 and { "Loaded", "Loaded", "Loaded" } or {
        "Loading1",
        "Loading2",
        "Loading3",
      })[math.floor(vim.loop.hrtime() / 12e7) % 3 + 1]],
      Lsp.title and escape(Lsp.title) or "",
      Lsp.message and escape(Lsp.message) or "",
      Lsp.percentage or 0
    )
  end,
}

local LSPActive = {
  condition = conditions.lsp_attached,
  update = {'LspAttach', 'LspDetach'},

  provider  = function()
      local names = {}
      for i, server in pairs(vim.lsp.get_active_clients({ bufnr = 0 })) do
          table.insert(names, server.name)
      end
      return icon.ActiveLSP .. " " .. table.concat(names, " ")
  end,
  hl = { fg = "fg", bold = true },
}

local StatusLines = {
  hl = function()
      if conditions.is_active() then
          return "StatusLine"
      else
          return "StatusLineNC"
      end
  end,
  ViMode,
  Space,
  Space,
  Git,
  Space,
  Space,
  FileType,
  Space,
  Space,
  GitDiff,
  Space,
  Space,
  Diagnostics,
  { provider = "%=" },
  LSPProgress,
  Space,
  Space,
  LSPActive,
  Space,
  Space,
  ScrollBar
}

vim.api.nvim_create_autocmd("User", {
  pattern = 'HeirlineInitWinbar',
  callback = function(args)
      local buf = args.buf
      local buftype = vim.tbl_contains(
          { "terminal", "prompt", "nofile", "help", "quickfix" },
          vim.bo[buf].buftype
      )
      local filetype = vim.tbl_contains(
        {"neo-tree", "dashboard", "Outline", "aerial" },
        vim.bo[buf].filetype
      )
      if buftype or filetype then
          vim.opt_local.winbar = nil
      end
  end,
})

local WinBars = {
  fallthrough = false,
  {
    condition = function()
      return conditions.buffer_matches({
        buftype = { "terminal", "prompt", "nofile", "help", "quickfix" },
        filetype = { "neo-tree", "dashboard", "Outline", "aerial" },
      })
    end,
    init = function()
        vim.opt_local.winbar = nil
    end
  },
}

local TablineFileName = {
  provider = function(self)
      local filename = self.filename
      filename = filename == "" and "[No Name]" or vim.fn.fnamemodify(filename, ":t")
      return filename
  end,
  hl = function(self)
      return { bold = self.is_active or self.is_visible, italic = true }
  end,
}

local TablineFileFlags = {
  {
    condition = function(self)
      return vim.api.nvim_buf_get_option(self.bufnr, "modified")
    end,
    provider = icon.FileModified,
    hl = { fg = "yellow" },
  },
  {
    condition = function(self)
      return not vim.api.nvim_buf_get_option(self.bufnr, "modifiable")
        or vim.api.nvim_buf_get_option(self.bufnr, "readonly")
    end,
    provider = function(self)
      if vim.api.nvim_buf_get_option(self.bufnr, "buftype") == "terminal" then
        return ""
      else
        return ""
      end
    end,
    hl = { fg = "red" },
  },
}

local TablineCloseButton = {
  condition = function(self)
      return not vim.api.nvim_buf_get_option(self.bufnr, "modified")
  end,
  update = {'WinNew', 'WinClosed', 'BufEnter'},
  {
    provider = icon.BufferClose,
    hl = { fg = "gray" },
    on_click = {
      callback = function(_, minwid)
        require("bufdelete").bufdelete(minwid, false)
      end,
      minwid = function(self)
        return self.bufnr
      end,
      name = "heirline_tabline_close_buffer_callback",
    },
  },
}

local FileIcon = {
  init = function(self)
      local filename = vim.api.nvim_buf_get_name(self.bufnr)
      local extension = vim.fn.fnamemodify(filename, ":e")
      self.icon, self.icon_color = require("nvim-web-devicons").get_icon_color(filename, extension, { default = true })
  end,
  provider = function(self)
      return self.icon and (self.icon .. " ")
  end,
  hl = function(self)
      return { fg = self.icon_color }
  end
}


local TablineFileNameBlock = {
  init = function(self)
    self.filename = vim.api.nvim_buf_get_name(self.bufnr)
  end,
  hl = function(self)
    if self.is_active then
        return { underline = true, sp = colors.blue }
    end
  end,
  on_click = {
    callback = function(_, minwid, _, button)
      if (button == "m") then
        vim.api.nvim_buf_delete(minwid, {force = false})
      else
        vim.api.nvim_win_set_buf(0, minwid)
      end
    end,
    minwid = function(self)
      return self.bufnr
    end,
    name = "heirline_tabline_buffer_callback",
  },
  FileIcon,
  TablineFileName,
  TablineFileFlags,
  Space,
  TablineCloseButton,
}

local Tabpage = {
  provider = function(self)
      return "%" .. "T " .. self.tabpage .. " %T"
  end,
  hl = function(self)
      if not self.is_active then
          return "TabLine"
      else
          return "TabLineSel"
      end
  end,
}

local TabpageClose = {
  provider = icon.NeovimClose,
  hl = "TabLine",
}

local TabPages = {
  condition = function()
      return #vim.api.nvim_list_tabpages() >= 2
  end,
  { provider = "%=" },
  utils.make_tablist(Tabpage),
  TabpageClose,
}

local TabLineOffset = {
  condition = function(self)
    local win = vim.api.nvim_tabpage_list_wins(0)[1]
    local bufnr = vim.api.nvim_win_get_buf(win)
    self.winid = win

    if vim.bo[bufnr].filetype == "neo-tree" then
        return true
    end
  end,

  provider = function(self)
    return string.rep(" ", vim.api.nvim_win_get_width(self.winid))
  end,

  hl = function(self)
    if vim.api.nvim_get_current_win() == self.winid then
      return "TablineSel"
    else
      return "Tabline"
    end
  end,
}

local BufferLine = utils.make_buflist(
  { TablineFileNameBlock, Space },
  { provider = icon.ArrowLeft, Space, hl = { fg = "blue" } }, -- left truncation, optional (defaults to "<")
  { provider = icon.ArrowRight, hl = { fg = "blue" } } -- right trunctation, also optional (defaults to ...... yep, ">")
)

local TabLine = { TabLineOffset, BufferLine, TabPages }
require("heirline").setup({
  statusline = StatusLines,
  winbar = WinBars,
  tabline = TabLine
})

vim.cmd([[au FileType * if index(['wipe', 'delete'], &bufhidden) >= 0 | set nobuflisted | endif]])

