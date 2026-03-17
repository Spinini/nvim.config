require('gitsigns').setup {}
require('neogit').setup {}

local neogit = require 'neogit'

vim.keymap.set('n', '<leader>gg', function() neogit.open { kind = 'floating' } end, { desc = 'Neogit' })
