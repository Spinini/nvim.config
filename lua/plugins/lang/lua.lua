ensure_installed 'lua-language-server'
ensure_installed 'stylua'

vim.lsp.enable { 'lua_ls' }
vim.lsp.enable { 'stylua' }

require('lazydev').setup { library = { '~/.config/nvim/**/*' } }

require('nvim-treesitter').install { 'lua' }
