-- Configs
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.mouse = 'a'
-- TODO: change this when using new status line
vim.o.showmode = false
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)
vim.o.breakindent = true
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.signcolumn = 'yes'
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.o.inccommand = 'split'
vim.o.cursorline = true
vim.o.scrolloff = 10
vim.o.confirm = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
-- Keybinds vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- Package manager
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
      { out, 'WarningMsg' },
      { '\nPress any key to exit...' },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Packages
require('lazy').setup {
  spec = {
    -- Theme
    {
      'ellisonleao/gruvbox.nvim',
      priority = 1000,
      lazy = false,
      config = function()
        vim.cmd.colorscheme 'gruvbox'
      end,
    },
    -- Which-key
    {
      'folke/which-key.nvim',
      event = 'VeryLazy',
      opts = {
        preset = 'helix',
        spec = {
          { '<leader>f', group = '[F]iles' },
          { '<leader>d', group = '[D]iagnostics' },
          { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
        },
      },
      keys = {
        {
          '<leader>?',
          function()
            require('which-key').show { global = false }
          end,
          desc = 'Buffer Local Keymaps (which-key)',
        },
      },
    },
    -- Treesitter
    {
      'nvim-treesitter/nvim-treesitter',
      opts = {
        auto_install = true,
        ensure_installed = { 'lua' },
      },
    },
    -- Mini Nvim
    {
      'echasnovski/mini.nvim',
      config = function()
        require('mini.ai').setup { n_lines = 500 }
        require('mini.icons').setup()
        require('mini.pairs').setup()
        require('mini.surround').setup()
        require('mini.statusline').setup()
      end,
    },
    -- LSP
    {
      'neovim/nvim-lspconfig',
      config = function()
        vim.api.nvim_set_keymap('n', '<leader>do', '<cmd>lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', '<leader>d[', '<cmd>lua vim.diagnostic.goto_prev()<CR>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', '<leader>d]', '<cmd>lua vim.diagnostic.goto_next()<CR>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', '<leader>da', '<cmd>lua FzfLua.lsp_code_actions()<CR>', { noremap = true, silent = true })
        vim.diagnostic.config {
          severity_sort = true,
          float = { border = 'rounded', source = 'if_many' },
          underline = { severity = vim.diagnostic.severity.ERROR },
          signs = vim.g.have_nerd_font and {
            text = {
              [vim.diagnostic.severity.ERROR] = '󰅚 ',
              [vim.diagnostic.severity.WARN] = '󰀪 ',
              [vim.diagnostic.severity.INFO] = '󰋽 ',
              [vim.diagnostic.severity.HINT] = '󰌶 ',
            },
          } or {},
          virtual_text = {
            source = 'if_many',
            spacing = 4,
            format = function(diagnostic)
              local diagnostic_message = {
                [vim.diagnostic.severity.ERROR] = diagnostic.message,
                [vim.diagnostic.severity.WARN] = diagnostic.message,
                [vim.diagnostic.severity.INFO] = diagnostic.message,
                [vim.diagnostic.severity.HINT] = diagnostic.message,
              }
              return diagnostic_message[diagnostic.severity]
            end,
          },
        }
      end,
      dependencies = {
        {
          'mason-org/mason.nvim',
          build = ':MasonUpdate',
          cmd = { 'Mason', 'MasonUpdate', 'MasonLog', 'MasonInstall', 'MasonUninstall', 'MasonUninstallAll' },
          config = true,
        },
        {
          'mason-org/mason-lspconfig.nvim',
          config = true,
          keys = {
            { '<C-space>', '<cmd>lua vim.lsp.completion.get()  <CR>', mode = 'i' },
            { 'gh', '<cmd>lua vim.lsp.buf.hover()       <CR>' },
            { 'gd', '<cmd>lua vim.lsp.buf.definition()  <CR>' },
            { 'gD', '<cmd>lua vim.lsp.buf.declaration() <CR>' },
          },
        },
        { 'j-hui/fidget.nvim', opts = {} },
        { 'folke/lazydev.nvim', opts = {} },
      },
    },
    -- Formatting
    {
      'stevearc/conform.nvim',
      event = { 'BufReadPre', 'BufNewFile' },
      config = function()
        local conform = require 'conform'

        conform.setup {
          formatters_by_ft = {
            javascript = { 'prettier' },
            typescript = { 'prettier' },
            javascriptreact = { 'prettier' },
            typescriptreact = { 'prettier' },
            svelte = { 'prettier' },
            css = { 'prettier' },
            html = { 'prettier' },
            json = { 'prettier' },
            yaml = { 'prettier' },
            markdown = { 'prettier' },
            graphql = { 'prettier' },
            lua = { 'stylua', append_args = { '--indent_type=Spaces' } },
            python = { 'ruff' },
          },
          format_on_save = {
            lsp_fallback = true,
            async = false,
            timeout_ms = 500,
          },
        }
      end,
    },
    -- Autocomplete
    {
      'Saghen/blink.cmp',
      version = '1.*',
      opts = {
        keymap = { preset = 'default' },
        appearance = {
          nerd_font_variant = 'mono',
        },
        completion = { documentation = { auto_show = false } },
        sources = {
          default = { 'lsp', 'path', 'snippets', 'buffer' },
        },
        fuzzy = { implementation = 'lua' },
      },
      opts_extend = { 'sources.default' },
    },
    -- Search
    {
      'ibhagwan/fzf-lua',
      config = function()
        local fzf = require 'fzf-lua'
        fzf.register_ui_select()
      end,
    },
    -- Indents length detection
    {
      'NMAC427/guess-indent.nvim',
      config = true,
    },
  },
  install = { colorscheme = { 'gruvbox' } },
  checker = { enabled = true },
}
