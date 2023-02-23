for _, load_type in ipairs { "vscode", "snipmate", "lua" } do
  local loader = require("luasnip.loaders.from_" .. load_type)
  loader.lazy_load()
end

