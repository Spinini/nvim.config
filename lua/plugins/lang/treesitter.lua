lang_list = {
    'vim',
    'vimdoc',
    'rust',
    'c',
    'cpp',
    'go',
    'html',
    'css',
    'javascript',
    'json',
    'lua',
    'markdown',
    'python',
    'typescript',
    'vue',
    'slang',
    'svelte',
    'bash',
    'lua',
    'python',
}

require('nvim-treesitter').install(lang_list)

vim.api.nvim_create_autocmd({ 'BufEnter', 'FileType' }, {
    pattern = lang_list,
    callback = function(args)
        vim.treesitter.start(args.buf)
        vim.bo[args.buf].syntax = 'ON' -- Enable regex if treesitter fails
    end,
})
