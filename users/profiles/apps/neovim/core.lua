require('impatient').enable_profile()

local map = vim.keymap.set
-- From Astrovim
local function set_mappings(map_table, base)
  for mode, maps in pairs(map_table) do
    for keymap, options in pairs(maps) do
      if options then
        local cmd = options
        local keymap_opts = base or {}
        if type(options) == "table" then
          cmd = options[1]
          keymap_opts = vim.tbl_deep_extend("force", options, keymap_opts)
          keymap_opts[1] = nil
        end
        map(mode, keymap, cmd, keymap_opts)
      end
    end
  end
end

