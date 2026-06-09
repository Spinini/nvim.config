vim.pack.add { gh 'rebelot/kanagawa.nvim' }
require('kanagawa').setup {
    commentStyle = { italic = false },
}
vim.cmd.colorscheme 'kanagawa-wave'
