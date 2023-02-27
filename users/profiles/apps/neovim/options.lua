-- Astrovim
local function vim_opts(options)
  for scope, table in pairs(options) do
    for setting, value in pairs(table) do
      vim[scope][setting] = value
    end
  end
end

vim_opts({
  opt = {
    termguicolors = true,
    fillchars = { eob = " " },
    showmode = false,
    laststatus = 3,
    cmdheight = 0,
    showtabline = 2,
    updatetime = 300,
    number = true,
  },
  g = {
    mapleader = " ",
    cmp_enabled = true,
    lsp_handlers_enabled = true,
  }
})

