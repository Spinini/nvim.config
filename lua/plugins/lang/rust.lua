ensure_installed("rust-analyzer")

vim.lsp.enable({'rust_analyzer'})
require('conform').formatters_by_ft.rust = {'rustfmt'}
