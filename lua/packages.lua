vim.pack.add {
    -- Theme
    { src = 'https://github.com/nvim-tree/nvim-web-devicons' },
    { src = 'https://github.com/rebelot/kanagawa.nvim' },
    { src = 'https://github.com/navarasu/onedark.nvim' },
    { src = 'https://github.com/bluz71/vim-moonfly-colors' },
    -- Misc
    { src = 'https://github.com/nvim-mini/mini.nvim' },
    { src = 'https://github.com/NMAC427/guess-indent.nvim' },
    -- Find
    { src = 'https://github.com/mikavilpas/yazi.nvim' },
    { src = 'https://github.com/nvim-lua/plenary.nvim' },
    { src = 'https://github.com/ibhagwan/fzf-lua' },
    { src = 'https://github.com/MagicDuck/grug-far.nvim' },
    -- LSP
    { src = 'https://github.com/mason-org/mason.nvim' },
    { src = 'https://github.com/neovim/nvim-lspconfig' },
    { src = 'https://github.com/folke/lazydev.nvim' },
    { src = 'https://github.com/saghen/blink.cmp' },
    { src = 'https://github.com/stevearc/conform.nvim' },
    { src = 'https://github.com/linux-cultist/venv-selector.nvim' },
    -- Treesitter
    {
        src = 'https://github.com/nvim-treesitter/nvim-treesitter',
        branch = 'main',
        build = ':TSUpdate',
    },
    { src = 'https://github.com/RRethy/vim-illuminate' },
    -- Git
    { src = 'https://github.com/lewis6991/gitsigns.nvim' },
    -- MD
    { src = 'https://github.com/OXY2DEV/markview.nvim' },
}
