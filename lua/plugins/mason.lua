vim.pack.add {
    gh 'mason-org/mason.nvim',
    gh 'WhoIsSethDaniel/mason-tool-installer.nvim',
}

require('mason').setup {}
require('mason-tool-installer').setup {
    ensure_installed = {
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
        -- Terraform
        'tflint',
    },
}

vim.keymap.set('n', '<leader>pm', '<cmd>Mason<CR>', { desc = 'Mason' })
