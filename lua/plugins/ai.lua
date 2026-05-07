require('copilot').setup {}
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
    opts = {
        log_level = 'DEBUG',
    },
}
vim.keymap.set('n', '<leader>ac', '<cmd>CodeCompanionChat Toggle<CR>', { desc = 'Toggle AI Chat' })
