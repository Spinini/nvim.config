vim.keymap.set('n', '<leader>fb', '<cmd>FzfLua buffers<CR>', { desc = 'Find Buffers' })
vim.keymap.set('n', '<leader>ff', '<cmd>FzfLua files<CR>', { desc = 'Find Files' })
vim.keymap.set('n', '<leader>fg', '<cmd>FzfLua grep_visual<CR>', { desc = 'Grep Files' })

-- LSP Keymaps
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(event)
        local bufmap = function(mode, rhs, lhs, desc) vim.keymap.set(mode, rhs, lhs, { buffer = event.buf, desc = desc }) end
        bufmap('n', '<leader>la', '<Cmd>FzfLua lsp_code_actions<CR>', 'Code Action')
        bufmap('n', '<leader>ls', '<Cmd>FzfLua lsp_document_symbols<CR>', 'Document Symbols')
        bufmap('n', '<leader>lw', '<Cmd>FzfLua lsp_workspace_symbols<CR>', 'Workspace Symbols')
        bufmap('n', '<leader>ld', '<Cmd>FzfLua diagnostics_workspace<CR>', 'Workspace Diagnostics')
        bufmap('n', 'grr', '<Cmd>FzfLua lsp_references<CR>', '(Fzf) References')
    end,
})

-- Git Keymaps
vim.keymap.set('n', '<leader>gs', '<cmd>FzfLua git_status<CR>', { desc = 'Git Status' })
