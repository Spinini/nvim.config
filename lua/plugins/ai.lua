cp = require 'copilot'
cp.setup {
    panel = {
        layout = {
            position = 'bottom',
            ratio = 0.2,
        },
    },
    suggestion = {},
}

pa = require 'copilot.panel'
su = require 'copilot.suggestion'
ne = require 'copilot.nes'

vim.keymap.set('n', '<leader>ap', pa.toggle, { desc = 'Toggle Panel' })
vim.keymap.set('n', '<leader>as', su.toggle_auto_trigger, { desc = 'Toggle Suggestions' })

vim.keymap.set('i', '<C-l>', su.accept, { desc = 'Accept Suggestion' })
vim.keymap.set('i', '<C-p>', su.prev, { desc = 'Previous Suggestion' })
vim.keymap.set('i', '<C-n>', su.next, { desc = 'Next Suggestion' })

-- Hide/show suggestions if blink is open/close
vim.api.nvim_create_autocmd('User', {
    pattern = 'BlinkCmpMenuOpen',
    callback = function() vim.b.copilot_suggestion_hidden = true end,
})
vim.api.nvim_create_autocmd('User', {
    pattern = 'BlinkCmpMenuClose',
    callback = function() vim.b.copilot_suggestion_hidden = false end,
})

-- Setup Code Companion with Copilot adapter
require('codecompanion').setup {
    interactions = {
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
}
vim.keymap.set('n', '<leader>ac', '<cmd>CodeCompanionChat Toggle<CR>', { desc = 'Toggle AI Chat' })
