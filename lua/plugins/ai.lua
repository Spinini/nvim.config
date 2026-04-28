require('copilot').setup {}
require('codecompanion').setup {
    interactions = {
        chat = {
            adapter = 'copilot',
            model = 'gpt-4.1',
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
