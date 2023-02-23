local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.alejandra,
    null_ls.builtins.diagnostics.pyproject_flake8,
  },
  on_attach = lsp_on_attach,
})

