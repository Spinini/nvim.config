ensure_installed("clangd")
ensure_installed("clang-format")
vim.lsp.enable({"clangd"})
require('conform').formatters_by_ft.cpp = ({"clang-format"})
