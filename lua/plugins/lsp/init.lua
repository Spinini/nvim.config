require('mason').setup {
    ui = {
        icons = {
            package_installed = '✓',
            package_pending = '➜',
            package_uninstalled = '✗',
        },
    },
}

-- Ensure Mason package is installed
ensure_installed = function(package_name)
    local registry = require 'mason-registry'
    if not registry.is_installed(package_name) then vim.cmd('MasonInstall ' .. package_name) end
end

require 'plugins.lsp.lua'
require 'plugins.lsp.cpp'
require 'plugins.lsp.python'

-- Enable treesitter
vim.api.nvim_create_autocmd('FileType', {
    pattern = {
        'lua',
        'c',
        'cpp',
        'python',
    },
    callback = function()
        vim.treesitter.start()
    end,
})

require("plugins.lsp.keymaps")
require('blink-cmp').setup {
    fuzzy = {implementation = 'lua'}
}
