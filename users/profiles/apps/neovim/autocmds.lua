local cmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local alpha_group = augroup("alpha_settings", { clear = true })
cmd("User", {
  desc = "Disable status and tablines for alpha",
  group = alpha_group,
  pattern = "AlphaReady",
  callback = function()
    local prev_showtabline = vim.opt.showtabline
    local prev_status = vim.opt.laststatus
    vim.opt.laststatus = 0
    vim.opt.showtabline = 0
    vim.opt_local.winbar = nil
    cmd("BufUnload", {
      pattern = "<buffer>",
      callback = function()
        vim.opt.laststatus = prev_status
        vim.opt.showtabline = prev_showtabline
      end,
    })
  end,
})

