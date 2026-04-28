-- nvim-lspconfig: https://github.com/neovim/nvim-lspconfig/tree/master/lsp
-- conform: https://github.com/stevearc/conform.nvim/tree/master/lua/conform/formatters

-- C++
ensure_installed 'clangd'
ensure_installed 'clang-format'
vim.lsp.enable { 'clangd' }
require('conform').formatters_by_ft.cpp = { 'clang-format' }

-- CMake
ensure_installed 'neocmakelsp'
ensure_installed 'gersemi'
vim.lsp.enable { 'neocmake' }
require('conform').formatters_by_ft.cmake = { 'gersemi' }

-- Docker
ensure_installed 'docker-language-server'
vim.lsp.enable { 'docker_language_server' }

-- Json
ensure_installed 'jq'
require('conform').formatters_by_ft.json = { 'jq' }

-- Lua
ensure_installed 'lua-language-server'
ensure_installed 'stylua'

vim.lsp.enable { 'lua_ls' }
require('conform').formatters_by_ft.lua = { 'stylua' }

require('lazydev').setup {}

-- Markdown
require('render-markdown').setup {
    enabled = true,
    file_types = { 'markdown', 'codecompanion' },
}

-- Python
ensure_installed 'ruff'
ensure_installed 'basedpyright'

vim.lsp.enable { 'basedpyright' }
require('conform').formatters_by_ft.python = { 'ruff_format', 'ruff_fix' }

require('venv-selector').setup()

vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'python' },
    callback = function() vim.keymap.set('n', '<leader>lv', '<Cmd>VenvSelect<CR>', { buffer = true, desc = 'Select VirtualEnv' }) end,
})

-- Rust
ensure_installed 'rust-analyzer'
vim.lsp.enable { 'rust_analyzer' }
require('conform').formatters_by_ft.rust = { 'rustfmt' }

-- Slang
ensure_installed 'slang'
vim.lsp.enable { 'slangd' }

-- SQL
ensure_installed 'sqlfmt'
require('conform').formatters_by_ft.sql = { 'sqlfmt' }

-- Terraform
ensure_installed 'terraform'
ensure_installed 'terraform-ls'
vim.lsp.enable { 'terraformls' }
require('conform').formatters_by_ft.terraform = { 'terraform_fmt' }

-- Web
ensure_installed 'typescript-language-server'
ensure_installed 'prettierd'

vim.lsp.enable { 'ts_ls' }
require('conform').formatters_by_ft.html = { 'prettierd' }
require('conform').formatters_by_ft.typescript = { 'prettierd' }
require('conform').formatters_by_ft.javascript = { 'prettierd' }

-- Yaml
ensure_installed 'yamlfmt'
require('conform').formatters_by_ft.yaml = { 'yamlfmt' }
