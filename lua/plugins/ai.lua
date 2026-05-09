cp = require 'copilot'
cp.setup {
    panel = {
        layout = {
            position = 'bottom', -- | top | left | right | bottom |
            ratio = 0.2,
        },
    },
    -- nes = { enabled = true, auto_trigger = true },
}

pa = require 'copilot.panel'
su = require 'copilot.suggestion'
ne = require 'copilot.nes'

vim.keymap.set('n', '<leader>ap', pa.toggle, { desc = 'Toggle Panel' })
vim.keymap.set('n', '<leader>as', su.toggle_auto_trigger, { desc = 'Toggle Suggestions' })

-- Hide/show suggestions if blink is open/close
vim.api.nvim_create_autocmd('User', {
    pattern = 'BlinkCmpMenuOpen',
    callback = function() vim.b.copilot_suggestion_hidden = true end,
})
vim.api.nvim_create_autocmd('User', {
    pattern = 'BlinkCmpMenuClose',
    callback = function() vim.b.copilot_suggestion_hidden = false end,
})
