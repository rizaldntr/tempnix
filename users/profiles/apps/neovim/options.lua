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
  },
})

