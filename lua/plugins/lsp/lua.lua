ensure_installed 'lua-language-server'
ensure_installed 'stylua'

vim.lsp.enable { 'lua_ls' }
vim.lsp.enable { 'stylua' }

require('lazydev').setup {}
require('nvim-treesitter').install { 'lua' }
