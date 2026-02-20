fzf = require("fzf-lua")
require("yazi").setup(
    {
        open_for_directories = true,
        integrations = {
            grep_in_directory = "fzf-lua",
            grep_in_selected_files = "fzf-lua"
        }
    }
)
vim.g.loaded_netrwPlugin = 1
vim.keymap.set('n', '<leader>e', '<cmd>Yazi<CR>', { desc = 'Open File Browser' })
