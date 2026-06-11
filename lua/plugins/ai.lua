local ai_plugins = {
  gh 'nvim-lua/plenary.nvim',
  gh 'MunifTanjim/nui.nvim',
  gh 'zbirenbaum/copilot.lua',
  gh 'olimorris/codecompanion.nvim',
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

require('codecompanion').setup {
  strategies = {
    chat = {
      adapter = 'copilot',
    },
    inline = {
      adapter = 'copilot',
    },
    cmd = {
      adapter = 'copilot',
    },
  },
  display = {
    chat = {
      window = {
        layout = 'vertical',
        width = 0.4,
      },
    },
  },
}
vim.keymap.set('n', '<leader>ac', '<cmd>CodeCompanionChat Toggle<cr>', { desc = 'Toggle AI Chat' })

vim.keymap.set('v', '<leader>aa', '<cmd>CodeCompanionChat Add<cr>', { desc = 'Add selection to chat' })

vim.keymap.set('n', '<leader>ai', '<cmd>CodeCompanion<cr>', { desc = 'Inline prompt' })

local function inline_prompt()
  vim.ui.input({
    prompt = 'CodeCompanion: ',
  }, function(input)
    if input and input ~= '' then vim.cmd("'<,'>CodeCompanion " .. input) end
  end)
end

vim.keymap.set('v', '<leader>ap', inline_prompt, {
  desc = 'Custom AI prompt',
})
