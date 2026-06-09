-- Markdown Renderer
vim.pack.add { gh 'MeanderingProgrammer/render-markdown.nvim' }
require('render-markdown').setup {
  enabled = true,
  file_types = { 'markdown', 'codecompanion' },
}

-- Python Virtual Environment Selector
vim.pack.add { gh 'linux-cultist/venv-selector.nvim' }
require('venv-selector').setup()

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'python' },
  callback = function() vim.keymap.set('n', '<leader>v', '<Cmd>VenvSelect<CR>', { buffer = true, desc = 'Select VirtualEnv' }) end,
})
