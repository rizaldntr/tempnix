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
  Git,
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

local FileNameBlock = {
  init = function(self)
    self.filename = vim.api.nvim_buf_get_name(0)
  end,
}

local FileIcon = {
  init = function(self)
    local filename = self.filename
    if filename == "" then return "" end
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

local FileName = {
  provider = function(self)
    local filename = vim.fn.fnamemodify(self.filename, ":.")
    if filename == "" then return "" end
    if not conditions.width_percent_below(#filename, 0.25) then
        filename = vim.fn.pathshorten(filename)
    end
    return filename
  end,
  hl = { fg = utils.get_highlight("Directory").fg },
}

local FileFlags = {
  {
    condition = function()
        return vim.bo.modified
    end,
    provider = "[+]",
    hl = { fg = "green" },
  },
  {
    condition = function()
      return not vim.bo.modifiable or vim.bo.readonly
    end,
    provider = "",
    hl = { fg = "red" },
  },
}

local FileNameModifer = {
  hl = function()
    if vim.bo.modified then
      return { fg = "cyan", bold = true, force=true }
    end
  end,
}

FileNameBlock = utils.insert(FileNameBlock,
  FileIcon,
  utils.insert(FileNameModifer, FileName),
  FileFlags,
  { provider = '%<'}
)

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

local TablineBufnr = {
  provider = function(self)
      return tostring(self.bufnr) .. ". "
  end,
  hl = "Comment",
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
    provider = "[+]",
    hl = { fg = "green" },
  },
  {
    condition = function(self)
      return not vim.api.nvim_buf_get_option(self.bufnr, "modifiable")
        or vim.api.nvim_buf_get_option(self.bufnr, "readonly")
    end,
    provider = function(self)
      if vim.api.nvim_buf_get_option(self.bufnr, "buftype") == "terminal" then
        return "  "
      else
        return ""
      end
    end,
    hl = { fg = "red" },
  },
}

local TablineFileNameBlock = {
  init = function(self)
      self.filename = vim.api.nvim_buf_get_name(self.bufnr)
  end,
  hl = function(self)
      if self.is_active then
          return "TabLineSel"
      else
          return "TabLine"
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
  TablineBufnr,
  FileIcon,
  TablineFileName,
  TablineFileFlags,
}

local TablineCloseButton = {
  condition = function(self)
      return not vim.api.nvim_buf_get_option(self.bufnr, "modified")
  end,
  update = {'WinNew', 'WinClosed', 'BufEnter'},
  { provider = " " },
  {
    provider = "",
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

local TablineBufferBlock = utils.surround({ "", "" }, function(self)
  if self.is_active then
      return utils.get_highlight("TabLineSel").bg
  else
      return utils.get_highlight("TabLine").bg
  end
end, { TablineFileNameBlock, TablineCloseButton })

local Tabpage = {
  provider = function(self)
      return "%" .. self.tabnr .. "T " .. self.tabpage .. " %T"
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
  provider = "%999X  %X",
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
          self.title = "neo-tree"
          return true
      end
  end,

  provider = function(self)
      local title = self.title
      local width = vim.api.nvim_win_get_width(self.winid)
      local pad = math.ceil((width - #title) / 2)
      return string.rep(" ", pad) .. title .. string.rep(" ", pad)
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
  TablineBufferBlock,
  { provider = "", hl = { fg = "gray" } }, -- left truncation, optional (defaults to "<")
  { provider = "", hl = { fg = "gray" } } -- right trunctation, also optional (defaults to ...... yep, ">")
)

local TabLine = { TabLineOffset, BufferLine, TabPages }
require("heirline").setup({
  statusline = StatusLines,
  winbar = WinBars,
  tabline = TabLine
})

vim.cmd([[au FileType * if index(['wipe', 'delete'], &bufhidden) >= 0 | set nobuflisted | endif]])

