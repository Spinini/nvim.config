vim.pack.add { gh 'folke/todo-comments.nvim' }
require('todo-comments').setup { signs = false }

if vim.g.have_nerd_font then vim.pack.add { gh 'nvim-tree/nvim-web-devicons' } end

vim.pack.add { gh 'folke/which-key.nvim' }
require('which-key').setup {
    preset = "helix",
    -- Delay between pressing a key and opening which-key (milliseconds)
    delay = 0,
    icons = { mappings = vim.g.have_nerd_font },

    -- Document existing key chains
    spec = {
        { '<leader>d', group = '[D]ebug',    mode = { 'n', 'v' } },
        { '<leader>f', group = '[F]ind',    mode = { 'n', 'v' } },
        { '<leader>t', group = '[T]oggle' },
        { '<leader>h', group = 'Git [H]unk',  mode = { 'n', 'v' } }, -- Enable gitsigns recommended keymaps first
        { '<leader>p', group = '[P]ackages',  mode = { 'n', 'v' } }, -- Enable gitsigns recommended keymaps first
        { 'gr',        group = 'LSP Actions', mode = { 'n' } },
    },
}
