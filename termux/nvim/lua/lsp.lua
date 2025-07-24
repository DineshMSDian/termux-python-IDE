-- LSP setup for Python in Termux
local lspconfig = require('lspconfig')
local mason = require('mason')
local mason_lspconfig = require('mason-lspconfig')

mason.setup()
mason_lspconfig.setup {
  ensure_installed = { 'pyright', 'lua_ls' },
}

local cmp = require('cmp')
local cmp_nvim_lsp = require('cmp_nvim_lsp')
local capabilities = cmp_nvim_lsp.default_capabilities()

-- Pyright (Type analysis)
if vim.fn.executable('pyright-langserver') == 1 or vim.fn.executable('pyright') == 1 then
  lspconfig.pyright.setup {
    capabilities = capabilities,
    settings = {
      python = {
        analysis = {
          autoImportCompletions = true,
          typeCheckingMode = 'basic',
        },
      },
    },
  }
else
  -- Fallback: pylsp
  lspconfig.pylsp.setup {
    capabilities = capabilities,
    settings = {
      pylsp = {
        plugins = {
          pyflakes = { enabled = false },
          pycodestyle = { enabled = false },
          mccabe = { enabled = false },
          pylint = { enabled = false },
        },
      },
    },
  }
end
