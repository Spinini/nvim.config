lang_list = {
    'c',
    'cpp',
    'html',
    'json',
    'lua',
    'python',
    'javascript',
    'typescript',
    'yaml',
}

require("nvim-treesitter").install(lang_list)

vim.api.nvim_create_autocmd('FileType', {
    pattern = lang_list,
    callback = function()
        vim.treesitter.start()
    end,
})
