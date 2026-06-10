local ai_plugins = {
  gh 'nvim-lua/plenary.nvim',
  gh 'MunifTanjim/nui.nvim',
  gh 'zbirenbaum/copilot.lua',
}
vim.pack.add(ai_plugins)

require('copilot').setup {
  suggestion = {
    enabled = true,
    keymap = {
      accept = '<C-l>',
      next = '<C-j>',
      prev = '<C-k>',
      dismiss = '<C-h>',
    },
  },
  panel = { enabled = false },
}

local suggestion = require 'copilot.suggestion'

vim.keymap.set('n', '<leader>at', function() suggestion.toggle_auto_trigger() end, { desc = 'Toggle Copilot suggestions' })
