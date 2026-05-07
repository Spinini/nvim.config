require('copilot').setup {}
require('codecompanion').setup {
    interactions = {
        chat = {
            adapter = 'copilot',
            model = 'claude-sonnet-4.6',
        },
        inline = {
            adapter = 'copilot',
        },
        cmd = {
            adapter = 'copilot',
        },
    },
    opts = {
        log_level = 'DEBUG',
    },
}
vim.keymap.set('n', '<leader>ac', '<cmd>CodeCompanionChat Toggle<CR>', { desc = 'Toggle AI Chat' })
