lang_list = {
    'c',
    'cpp',
    'json',
    'lua',
    'python',
    'yaml',
}

require("nvim-treesitter").install(lang_list)

vim.api.nvim_create_autocmd('FileType', {
    pattern = lang_list,
    callback = function()
        vim.treesitter.start()
    end,
})
