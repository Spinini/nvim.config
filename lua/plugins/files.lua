vim.pack.add({ gh 'mikavilpas/yazi.nvim' })
require('yazi').setup {
    open_for_directories = true,
    integrations = {
        grep_in_directory = 'snacks.picker',
        grep_in_selected_files = 'snacks.picker',
    },
}
vim.g.loaded_netrwPlugin = 1
vim.keymap.set('n', '\\', '<cmd>Yazi<CR>', { desc = 'Open File Browser' })
