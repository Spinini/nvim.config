vim.keymap.set("n", "<leader>ff", fzf.files, { desc = 'Files'})
vim.keymap.set("n", "<leader>fg", fzf.live_grep, { desc = 'Live Grep'})
vim.keymap.set("n", "<leader>fb", fzf.lgrep_curbuf, { desc = 'Live Grep Buffer'})
vim.keymap.set("n", "<leader>b", fzf.buffers, { desc = 'Buffers'})
vim.keymap.set("n", "<leader>fh", fzf.help_tags, { desc = 'Help Tags'})

-- LSP Keymaps
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(event)
        local bufmap = function(mode, rhs, lhs, desc) vim.keymap.set(mode, rhs, lhs, { buffer = event.buf, desc = desc }) end
        -- gr keymaps
        bufmap('n', 'gra', '<Cmd>FzfLua lsp_code_actions<CR>', '(Fzf) Code Action')
        bufmap('n', 'grr', '<Cmd>FzfLua lsp_references<CR>', '(Fzf) References')
        -- Leader Keymaps
        bufmap('n', '<leader>la', '<Cmd>FzfLua lsp_code_actions<CR>', 'Code Action')
        bufmap('n', '<leader>ls', '<Cmd>FzfLua lsp_document_symbols<CR>', 'Document Symbols')
        bufmap('n', '<leader>lw', '<Cmd>FzfLua lsp_workspace_symbols<CR>', 'Workspace Symbols')
        bufmap('n', '<leader>ld', '<Cmd>FzfLua diagnostics_document<CR>', 'Document Diagnostics')
        bufmap('n', '<leader>lw', '<Cmd>FzfLua diagnostics_workspace<CR>', 'Workspace Diagnostics')
    end,
})

-- Git Keymaps
--
vim.keymap.set('n', '<leader>gs', '<cmd>FzfLua git_status<CR>', { desc = 'Git Status' })
vim.keymap.set('n', '<leader>gb', '<cmd>FzfLua git_blame<CR>', { desc = 'Git Blame' })
