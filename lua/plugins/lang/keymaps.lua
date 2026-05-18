-- LSP Keymaps
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(event)
        local bufmap = function(mode, rhs, lhs, desc) vim.keymap.set(mode, rhs, lhs, { buffer = event.buf, desc = desc }) end
        bufmap('n', '<leader>lf', vim.lsp.buf.format, 'LSP Format')
        bufmap('n', '<leader>lr', vim.lsp.buf.rename, 'Rename Symbol')
        bufmap('n', 'gd', vim.lsp.buf.definition, '(LSP) Go To Definition')
        bufmap('n', 'gi', vim.lsp.buf.implementation, '(LSP) Go To Implementation')
        bufmap('n', 'gy', vim.lsp.buf.type_definition, '(LSP) Go To Type Definition')
        bufmap('n', 'gD', vim.lsp.buf.declaration, '(LSP) Go To Declaraction')
        bufmap('n', 'K', function() return vim.lsp.buf.hover() end, '(LSP) Hover')
        bufmap('n', 'gK', function() return vim.lsp.buf.signature_help() end, '(LSP) Signature Help')
    end,
})
local conform = require 'conform'
local format_with_fallback = function()
    conform.format { lsp_format = 'fallback' }
    vim.cmd 'GuessIndent silent'
end

vim.keymap.set('n', '<leader>pm', '<cmd>Mason<CR>', { desc = 'Mason' })
vim.keymap.set('n', 'gl', vim.diagnostic.open_float)
vim.keymap.set({ 'n', 'x' }, 'gq', format_with_fallback, { desc = 'Conform Format' })
