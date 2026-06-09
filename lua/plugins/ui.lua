-- Highlight TODO: comments
vim.pack.add { gh 'folke/todo-comments.nvim' }
require('todo-comments').setup { signs = false }

-- Add web devicons
if vim.g.have_nerd_font then vim.pack.add { gh 'nvim-tree/nvim-web-devicons' } end

-- Show keymaps
vim.pack.add { gh 'folke/which-key.nvim' }
require('which-key').setup {
  -- Helix = lower right corner
  preset = 'helix',

  -- Delay between pressing a key and opening which-key (milliseconds)
  delay = 150,
  icons = { mappings = vim.g.have_nerd_font },

  -- Document existing key chains
  spec = {
    { '<leader>d', group = '[D]ebug', mode = { 'n', 'v' } },
    { '<leader>f', group = '[F]ind', mode = { 'n', 'v' } },
    { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
    { '<leader>p', group = '[P]ackages', mode = { 'n', 'v' } },
    { '<leader>t', group = '[T]oggle', mode = { 'n', 'v' } },
    { 'gr', group = 'LSP Actions', mode = { 'n' } },
  },
}
