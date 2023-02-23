local maps = { i = {}, n = {}, v = {}, t = {} }

-- Normal --
-- Standard Operations
maps.n["<leader>w"] = { "<cmd>w<cr>", desc = "Save" }
maps.n["<leader>q"] = { "<cmd>q<cr>", desc = "Quit" }
maps.n["<leader>h"] = { "<cmd>nohlsearch<cr>", desc = "No Highlight" } -- TODO: REMOVE IN v3
maps.n["<leader>fn"] = { "<cmd>enew<cr>", desc = "New File" }
maps.n["<C-s>"] = { "<cmd>w!<cr>", desc = "Force write" }
maps.n["<C-q>"] = { "<cmd>q!<cr>", desc = "Force quit" }
maps.n["Q"] = "<Nop>"
maps.n["|"] = { "<cmd>vsplit<cr>", desc = "Vertical Split" }
maps.n["\\"] = { "<cmd>split<cr>", desc = "Horizontal Split" }

maps.n["<leader>d"] = { function() require("alpha").start() end, desc = "Alpha Dashboard" }

-- Telescope
maps.n["<leader>fw"] = { function() require("telescope.builtin").live_grep() end, desc = "Search words" }
maps.n["<leader>fW"] = {
  function()
    require("telescope.builtin").live_grep {
      additional_args = function(args) return vim.list_extend(args, { "--hidden", "--no-ignore" }) end,
    }
  end,
  desc = "Search words in all files",
}
maps.n["<leader>gt"] = { function() require("telescope.builtin").git_status() end, desc = "Git status" }
maps.n["<leader>gb"] = { function() require("telescope.builtin").git_branches() end, desc = "Git branches" }
maps.n["<leader>gc"] = { function() require("telescope.builtin").git_commits() end, desc = "Git commits" }
maps.n["<leader>ff"] = { function() require("telescope.builtin").find_files() end, desc = "Search files" }
maps.n["<leader>fF"] = {
  function() require("telescope.builtin").find_files { hidden = true, no_ignore = true } end,
  desc = "Search all files",
}
maps.n["<leader>fb"] = { function() require("telescope.builtin").buffers() end, desc = "Search buffers" }
maps.n["<leader>fh"] = { function() require("telescope.builtin").help_tags() end, desc = "Search help" }
maps.n["<leader>fm"] = { function() require("telescope.builtin").marks() end, desc = "Search marks" }
maps.n["<leader>fo"] = { function() require("telescope.builtin").oldfiles() end, desc = "Search history" }
maps.n["<leader>fc"] =
  { function() require("telescope.builtin").grep_string() end, desc = "Search for word under cursor" }
maps.n["<leader>sb"] = { function() require("telescope.builtin").git_branches() end, desc = "Git branches" }
maps.n["<leader>sh"] = { function() require("telescope.builtin").help_tags() end, desc = "Search help" }
maps.n["<leader>sm"] = { function() require("telescope.builtin").man_pages() end, desc = "Search man" }
maps.n["<leader>sr"] = { function() require("telescope.builtin").registers() end, desc = "Search registers" }
maps.n["<leader>sk"] = { function() require("telescope.builtin").keymaps() end, desc = "Search keymaps" }
maps.n["<leader>sc"] = { function() require("telescope.builtin").commands() end, desc = "Search commands" }
-- if astronvim.is_available "nvim-notify" then
--   maps.n["<leader>sn"] =
--     { function() require("telescope").extensions.notify.notify() end, desc = "Search notifications" }
-- end
maps.n["<leader>ls"] = { function() require("telescope").extensions.aerial.aerial() end, desc = "Search symbols" }
maps.n["<leader>lD"] = { function() require("telescope.builtin").diagnostics() end, desc = "Search diagnostics" }

-- Toggleterm
local user_terminals = {}
local function toggle_term_cmd(opts)
  local terms = user_terminals
  -- if a command string is provided, create a basic table for Terminal:new() options
  if type(opts) == "string" then opts = { cmd = opts, hidden = true } end
  local num = vim.v.count > 0 and vim.v.count or 1
  -- if terminal doesn't exist yet, create it
  if not terms[opts.cmd] then terms[opts.cmd] = {} end
  if not terms[opts.cmd][num] then
    if not opts.count then opts.count = vim.tbl_count(terms) * 100 + num end
    terms[opts.cmd][num] = require("toggleterm.terminal").Terminal:new(opts)
  end
  -- toggle the terminal
  user_terminals[opts.cmd][num]:toggle()
end

if vim.fn.executable "lazygit" == 1 then
  maps.n["<leader>tl"] = { function() toggle_term_cmd "lazygit" end, desc = "ToggleTerm lazygit" }
end
if vim.fn.executable "node" == 1 then
  maps.n["<leader>tn"] = { function() toggle_term_cmd "node" end, desc = "ToggleTerm node" }
end
if vim.fn.executable "gdu" == 1 then
  maps.n["<leader>tu"] = { function() toggle_term_cmd "gdu" end, desc = "ToggleTerm gdu" }
end
if vim.fn.executable "btm" == 1 then
  maps.n["<leader>tt"] = { function() toggle_term_cmd "btm" end, desc = "ToggleTerm btm" }
end
if vim.fn.executable "python" == 1 then
  maps.n["<leader>tp"] = { function() toggle_term_cmd "python" end, desc = "ToggleTerm python" }
end

maps.n["<leader>tf"] = { "<cmd>ToggleTerm direction=float<cr>", desc = "ToggleTerm float" }
maps.n["<leader>th"] = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", desc = "ToggleTerm horizontal split" }
maps.n["<leader>tv"] = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", desc = "ToggleTerm vertical split" }
maps.n["<F7>"] = { "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" }
maps.t["<F7>"] = maps.n["<F7>"]
maps.n["<C-'>"] = maps.n["<F7>"]
maps.t["<C-'>"] = maps.n["<F7>"]

-- NeoTree
maps.n["<leader>e"] = { "<cmd>Neotree toggle<cr>", desc = "Toggle Explorer" }
maps.n["<leader>o"] = { "<cmd>Neotree focus<cr>", desc = "Focus Explorer" }

-- LSP
maps.n["<leader>ld"] = { function() vim.diagnostic.open_float() end, desc = "Hover diagnostics" }
maps.n["[d"] = { function() vim.diagnostic.goto_prev() end, desc = "Previous diagnostic" }
maps.n["]d"] = { function() vim.diagnostic.goto_next() end, desc = "Next diagnostic" }
maps.n["gl"] = { function() vim.diagnostic.open_float() end, desc = "Hover diagnostics" }

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

set_mappings(maps)

