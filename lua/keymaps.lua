-- Exit terminal mode.
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Clear search highlights.
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Keeping the cursor centered.
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Scroll downwards' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Scroll upwards' })
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Next result' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Previous result' })

-- Switch between windows.
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Split window.
vim.keymap.set('n', 'tv', ':vsplit<CR>', { desc = 'Vertical Split' })
vim.keymap.set('n', 'th', ':split<CR>', { desc = 'Horizontal Split' })

-- Make U opposite to u.
vim.keymap.set('n', 'U', '<C-r>', { desc = 'Redo' })

-- Indent while remaining in visual mode.
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- Leader keymappings
vim.keymap.set('n', '<leader>w', ':write<CR>', { desc = 'Write' })
vim.keymap.set('n', '<leader>q', ':quit<CR>', { desc = 'Quit' })

-- Update Pack.
vim.keymap.set('n', '<leader>pu', vim.pack.update, { desc = 'Vim Pack Update' })
