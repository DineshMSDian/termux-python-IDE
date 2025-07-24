-- Termux Python IDE Neovim Config
-- Minimal, mobile-first, extendable.

-- Set <space> as leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Basic UI tweaks for small screens
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.scrolloff = 4
vim.opt.signcolumn = 'yes'
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.termguicolors = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.clipboard = 'unnamedplus'

-- Load plugin manager (lazy.nvim)
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({ 'git', 'clone', '--filter=blob:none', 'https://github.com/folke/lazy.nvim.git', '--branch=stable', lazypath })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup(require('plugins'))

-- Keymaps
require('mappings')

-- LSP + tools
require('lsp')
require('formatting')
