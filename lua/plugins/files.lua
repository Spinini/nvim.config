require("yazi").setup({open_for_directories = true})
vim.g.loaded_netrwPlugin = 1

vim.keymap.set('n', '<leader>e', '<cmd>Yazi<CR>', { desc = 'Open File Browser' })
