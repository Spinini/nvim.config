-- Main
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.o.mouse = 'a'
vim.o.showmode = false -- other statusbar already shows

-- Lines
vim.o.number = true
vim.o.relativenumber = true
vim.o.breakindent = true
vim.o.wrap = false

-- Tabs
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smarttab = true
vim.o.signcolumn = 'yes'

-- Files
vim.o.swapfile = false
vim.o.undofile = true

-- Cases
vim.o.ignorecase = true
vim.o.smartcase = true

-- Update
vim.o.updatetime = 250
-- vim.o.timeoutlen = 300

-- Split
vim.o.splitright = true
vim.o.splitbelow = true

vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

vim.o.inccommand = 'split'
vim.o.cursorline = true
vim.o.scrolloff = 10
vim.o.confirm = true

vim.schedule(function() vim.o.clipboard = 'unnamedplus' end)
