-- General keymaps (space leader set in init.lua)
local map = vim.keymap.set

-- Save
map('n', '<leader>w', '<cmd>w<cr>', { desc = 'Write buffer' })

-- Quit
map('n', '<leader>q', '<cmd>q<cr>', { desc = 'Quit' })

-- Run current Python file
map('n', '<leader>r', function()
  vim.cmd('write')
  vim.cmd('!python %')
end, { desc = 'Run current Python file' })

-- Lint (Ruff)
map('n', '<leader>l', function()
  vim.cmd('!ruff check %')
end, { desc = 'Ruff lint current file' })
