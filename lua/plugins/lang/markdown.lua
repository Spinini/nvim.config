require("markview").setup({
    preview = { enable = false }
});

-- vim.api.nvim_set_keymap("n", "<leader>m", "<CMD>Markview<CR>", { desc = "Toggles `markview` previews globally." });

vim.api.nvim_create_autocmd('FileType', {
    pattern = {'markdown'},
    callback = function()
        vim.keymap.set('n', '<leader>m', '<Cmd>Markview<CR>', { buffer = true, desc = 'Toggle Markview' })
    end
})
