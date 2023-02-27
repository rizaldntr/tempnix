vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

local signs = {
  { name = "DiagnosticSignError", text = icon["DiagnosticError"] },
  { name = "DiagnosticSignWarn", text = icon["DiagnosticWarn"] },
  { name = "DiagnosticSignHint", text = icon["DiagnosticHint"] },
  { name = "DiagnosticSignInfo", text = icon["DiagnosticInfo"] },
  { name = "DiagnosticSignError", text = icon["DiagnosticError"] },
  { name = "DapStopped", text = icon["DapStopped"], texthl = "DiagnosticWarn" },
  { name = "DapBreakpoint", text = icon["DapBreakpoint"], texthl = "DiagnosticInfo" },
  { name = "DapBreakpointRejected", text = icon["DapBreakpointRejected"], texthl = "DiagnosticError" },
  { name = "DapBreakpointCondition", text = icon["DapBreakpointCondition"], texthl = "DiagnosticInfo" },
  { name = "DapLogPoint", text = icon["DapLogPoint"], texthl = "DiagnosticInfo" },
}

for _, sign in ipairs(signs) do
  if not sign.texthl then sign.texthl = sign.name end
  vim.fn.sign_define(sign.name, sign)
end

vim.diagnostic.config({
  virtual_text = false,
  signs = { active = signs },
  update_in_insert = true,
  underline = true,
  severity_sort = true,
  float = {
    focused = false,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
})

local augrouplsp = vim.api.nvim_create_augroup("LSP", { clear = true })
lsp_on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)

  if client.supports_method("textDocument/formatting") then
    local autocmd_group = "auto_format_" .. bufnr
    vim.api.nvim_create_augroup(autocmd_group, { clear = true })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = autocmd_group,
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({ bufnr = bufnr, timeout_ms = 2000 })
      end,
    })
  end

  if client.supports_method("textDocument/hover") then
    vim.api.nvim_create_autocmd("CursorHold", {
      group = augrouplsp,
      buffer = bufnr,
      callback = function()
        vim.diagnostic.open_float()
      end,
    })
  end
end

require('lspconfig')['pyright'].setup{
  on_attach = lsp_on_attach,
}

require('lspconfig')['nil_ls'].setup{
  on_attach = lsp_on_attach,
}


