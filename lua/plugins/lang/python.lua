ensure_installed("ruff")
ensure_installed("ty")

vim.lsp.enable({"ty"})
vim.lsp.enable({"ruff"})

require("venv-selector").setup()

vim.api.nvim_create_autocmd('FileType', {
    pattern = {'python'},
    callback = function()
        vim.keymap.set('n', '<leader>lv', '<Cmd>VenvSelect<CR>', { buffer = true, desc = 'Select VirtualEnv' })
    end
})
