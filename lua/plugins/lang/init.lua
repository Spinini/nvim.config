require('mason').setup {
    ui = {
        icons = {
            package_installed = '✓',
            package_pending = '➜',
            package_uninstalled = '✗',
        },
    },
}

-- Autocomplete
require('blink-cmp').setup {
    fuzzy = {implementation = 'lua'}
}

-- Ensure Mason package is installed
ensure_installed = function(package_name)
    local registry = require 'mason-registry'
    if not registry.is_installed(package_name) then vim.cmd('MasonInstall ' .. package_name) end
end

lua_tools = require 'plugins.lang.lua'
cpp_tools = require 'plugins.lang.cpp'
python_tools = require 'plugins.lang.python'

-- Enable treesitter
vim.api.nvim_create_autocmd('FileType', {
    pattern = {
        -- Lua
        'lua',
        -- C
        'c',
        -- C++
        'cpp',
        -- Python
        'python',
    },
    callback = function()
        vim.treesitter.start()
        -- vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
        -- vim.wo[0][0].foldmethod = 'expr'
    end,
})
