ensure_installed("ruff")
ensure_installed("ty")
vim.lsp.enable({"ruff"})
vim.lsp.enable({"ty"})

require("nvim-treesitter").install({'python'})
require("venv-selector").setup{}
