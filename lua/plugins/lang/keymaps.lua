-- LSP Keymaps
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(event)
        local bufmap = function(mode, rhs, lhs, desc) vim.keymap.set(mode, rhs, lhs, { buffer = event.buf, desc = desc }) end
        bufmap('n', '<leader>lf', vim.lsp.buf.format, 'LSP Format')
        bufmap('n', '<leader>lr', vim.lsp.buf.rename, 'Rename Symbol')
        bufmap('n', 'gd', vim.lsp.buf.definition, '(LSP) Go To Definition')
        bufmap('n', 'grd', vim.lsp.buf.declaration, '(LSP) Go To Declaraction')
    end,
})
local conform = require 'conform'
local format_with_fallback = function() conform.format({lsp_format="fallback"}) end

vim.keymap.set('n', '<leader>pm', '<cmd>Mason<CR>', { desc = 'Mason' })
vim.keymap.set({ 'n', 'x' }, 'gq', format_with_fallback, { desc = 'Conform Format' })
