local ai_plugins = {
  gh 'nvim-lua/plenary.nvim',
  gh 'MunifTanjim/nui.nvim',
  gh 'zbirenbaum/copilot.lua',
  gh 'olimorris/codecompanion.nvim',
}
vim.pack.add(ai_plugins)

local ADAPTER = 'copilot'
local SUGGESTION_MODEL = vim.env.NVIM_SUGGESTION_MODEL or 'gpt-41-copilot'
-- local CHAT_MODEL = vim.env.NVIM_CHAT_MODEL or 'claude-haiku-4.5'
-- local INLINE_MODEL = vim.env.NVIM_INLINE_MODEL or 'claude-haiku-4.5'
-- local CMD_MODEL = vim.env.NVIM_CMD_MODEL or 'claude-haiku-4.5'
-- local BACKGROUND_MODEL = vim.env.NVIM_BACKGROUND_MODEL or 'claude-haiku-4.5'

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
  copilot_model = SUGGESTION_MODEL,
}
local suggestion = require 'copilot.suggestion'
vim.keymap.set('n', '<leader>at', function() suggestion.toggle_auto_trigger() end, { desc = 'Toggle Copilot suggestions' })

require('codecompanion').setup {
  strategies = {
    chat = {
      adapter = ADAPTER,
    },
    inline = {
      adapter = ADAPTER,
    },
    cmd = {
      adapter = ADAPTER,
    },
    background = {
      adapter = ADAPTER,
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
-- Show chat
vim.keymap.set('n', '<leader>ac', '<cmd>CodeCompanionChat Toggle<cr>', { desc = 'Toggle AI Chat' })

-- Add selection to chat
vim.keymap.set('v', '<leader>aa', '<cmd>CodeCompanionChat Add<cr>', { desc = 'Add selection to chat' })

-- Inline prompt
vim.keymap.set('n', '<leader>ai', '<cmd>CodeCompanion<cr>', { desc = 'Inline prompt' })

local function inline_prompt()
  vim.ui.input({ prompt = 'Prompt ' }, function(input) vim.cmd('CodeCompanion ' .. input) end)
end

-- Prompt about visual selection
vim.keymap.set('v', '<leader>ai', inline_prompt, {
  desc = 'Custom AI prompt',
})
