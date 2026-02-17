ensure_installed("ruff")
ensure_installed("basedpyright")

vim.lsp.enable({"basedpyright"})
require('conform').formatters_by_ft.python = {'ruff_format', 'ruff_fix'}

require("venv-selector").setup()

vim.api.nvim_create_autocmd('FileType', {
    pattern = {'python'},
    callback = function()
        vim.keymap.set('n', '<leader>lv', '<Cmd>VenvSelect<CR>', { buffer = true, desc = 'Select VirtualEnv' })
    end
})
