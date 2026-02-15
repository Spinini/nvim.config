ensure_installed 'lua-language-server'
ensure_installed 'stylua'

vim.lsp.enable { 'lua_ls' }
require('conform').formatters_by_ft.lua = {'stylua'}

require('lazydev').setup {}
require('nvim-treesitter').install { 'lua' }
