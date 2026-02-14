-- LSP Keymaps
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(event)
        local bufmap = function(mode, rhs, lhs, desc) vim.keymap.set(mode, rhs, lhs, { buffer = event.buf, desc = desc }) end
        bufmap('n', '<leader>lf', vim.lsp.buf.format, 'Format')
        bufmap('n', '<leader>lr', vim.lsp.buf.rename, 'Rename Symbol')
        bufmap('n', 'gd', vim.lsp.buf.definition, '(LSP) Go To Definition')
        bufmap('n', 'grd', vim.lsp.buf.declaration, '(LSP) Go To Declaraction')
        bufmap({ 'n', 'x' }, 'gq', '<cmd>lua vim.lsp.buf.format({async = true})<CR>', 'LSP Format')
    end,
})
