vim.pack.add {
  gh 'mason-org/mason.nvim',
  gh 'WhoIsSethDaniel/mason-tool-installer.nvim',
}

require('mason').setup {}
require('mason-tool-installer').setup {
  ensure_installed = {
    -- Bash
    'bash-language-server',
    'beautysh',
    -- C/C++
    'clangd',
    'clang-format',
    -- CMake
    'neocmakelsp',
    'gersemi',
    -- Docker
    'docker-language-server',
    -- JSON
    'jq',
    -- Lua
    'stylua',
    'lua-language-server',
    -- Markdown
    'markdownlint',
    -- Python
    'ruff',
    'ty',
    -- Rust
    'rust-analyzer',
    -- SQL
    'sqlfmt',
    -- Terraform
    'terraform',
    'terraform-ls',
    'tflint',
    -- Typescript
    'tsgo',
    'prettierd',
    -- YAML
    'yq',
    -- Zig
    'zls',
  },
}

vim.keymap.set('n', '<leader>pm', '<cmd>Mason<CR>', { desc = 'Mason' })
