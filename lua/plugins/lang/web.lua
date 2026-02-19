ensure_installed("typescript-language-server")
ensure_installed("prettierd")

vim.lsp.enable({'ts_ls'})
require('conform').formatters_by_ft.html = {'prettierd'}
require('conform').formatters_by_ft.typescript = {'prettierd'}
require('conform').formatters_by_ft.javascript = {'prettierd'}
