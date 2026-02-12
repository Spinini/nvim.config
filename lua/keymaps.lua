-- Std Keymaps
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', '<leader>q', ':quit<CR>', { desc = 'Quit' })
vim.keymap.set('n', '<leader>w', function()
    vim.lsp.buf.format()
    vim.cmd 'write'
end, { desc = 'Write' })
vim.keymap.set('n', '<leader>e', '<cmd>Yazi<CR>', { desc = 'Open File Browser' })

-- Window Nav
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- LSP Keybinds
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(event)
        local bufmap = function(mode, rhs, lhs, desc) vim.keymap.set(mode, rhs, lhs, { buffer = event.buf, desc = desc }) end
        bufmap('n', '<leader>lf', vim.lsp.buf.format, 'Format')
        bufmap('n', '<leader>lr', vim.lsp.buf.rename, 'Rename Symbol')
        bufmap('n', 'gd', vim.lsp.buf.definition, '(LSP) Go To Definition')
        bufmap('n', 'grr', '<Cmd>FzfLua lsp_references<CR>', '(Fzf) References')
        bufmap('n', 'grd', vim.lsp.buf.declaration, '(LSP) Go To Declaraction')
        bufmap({ 'n', 'x' }, 'gq', '<cmd>lua vim.lsp.buf.format({async = true})<CR>', 'LSP Format')
    end,
})
vim.keymap.set('n', '<leader>fb', '<cmd>FzfLua buffers<CR>', { desc = 'Find Buffers' })
vim.keymap.set('n', '<leader>ff', '<cmd>FzfLua files<CR>', { desc = 'Find Files' })
vim.keymap.set('n', '<leader>fg', '<cmd>FzfLua grep_visual<CR>', { desc = 'Grep Files' })

-- Miniclue setup
local miniclue = require 'mini.clue'
miniclue.setup {
    triggers = {
        { mode = { 'n', 'x' }, keys = '<Leader>' },
        { mode = 'n',          keys = '[' },
        { mode = 'n',          keys = ']' },
        { mode = 'i',          keys = '<C-x>' },
        { mode = { 'n', 'x' }, keys = 'g' },
        { mode = { 'n', 'x' }, keys = "'" },
        { mode = { 'n', 'x' }, keys = '`' },
        { mode = { 'n', 'x' }, keys = '"' },
        { mode = { 'i', 'c' }, keys = '<C-r>' },
        { mode = 'n',          keys = '<C-w>' },
        { mode = { 'n', 'x' }, keys = 'z' },
    },
    clues = {
        -- Enhance this by adding descriptions for <Leader> mapping groups
        { mode = 'n', keys = '<Leader>f', desc = '+Find' },
        { mode = 'n', keys = '<Leader>l', desc = '+LSP' },
        miniclue.gen_clues.square_brackets(),
        miniclue.gen_clues.builtin_completion(),
        miniclue.gen_clues.g(),
        miniclue.gen_clues.marks(),
        miniclue.gen_clues.registers(),
        miniclue.gen_clues.windows(),
        miniclue.gen_clues.z(),
    },
}
