-- Integrate Black + Ruff via null-ls
local null_ls = require('null-ls')

null_ls.setup {
  sources = {
    null_ls.builtins.formatting.black,
    null_ls.builtins.diagnostics.ruff.with({
      extra_args = {"--max-line-length=88"},
    }),
  },
  on_attach = function(client, bufnr)
    if client.supports_method('textDocument/formatting') then
      vim.keymap.set('n', '<leader>f', function()
        vim.lsp.buf.format({ bufnr = bufnr })
      end, { buffer = bufnr, desc = 'Format buffer' })
    end
  end,
}
