ensure_installed("clangd")
vim.lsp.enable({"clangd"})

require("nvim-treesitter").install({'c', 'cpp'})
