vim.keymap.set("n", "<leader>ff", fzf.files, { desc = 'Files'})
vim.keymap.set("n", "<leader>fg", fzf.live_grep, { desc = 'Live Grep'})
vim.keymap.set("n", "<leader>b", fzf.buffers, { desc = 'Buffers'})
vim.keymap.set("n", "<leader>fh", fzf.help_tags, { desc = 'Help Tags'})

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
