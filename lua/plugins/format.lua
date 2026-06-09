vim.pack.add { gh 'NMAC427/guess-indent.nvim' }
require('guess-indent').setup {}

vim.pack.add { gh 'windwp/nvim-autopairs' }
require('nvim-autopairs').setup {}

vim.pack.add { 'https://github.com/lukas-reineke/indent-blankline.nvim' }
require('ibl').setup {}

vim.pack.add { gh 'stevearc/conform.nvim' }
require('conform').setup {
  notify_on_error = false,
  format_on_save = function(bufnr)
    -- You can specify filetypes to autoformat on save here:
    local enabled_filetypes = {}
    if enabled_filetypes[vim.bo[bufnr].filetype] then
      return { timeout_ms = 500 }
    else
      return nil
    end
  end,
  default_format_opts = {
    lsp_format = 'fallback', -- Use external formatters if configured below, otherwise use LSP formatting. Set to `false` to disable LSP formatting entirely.
  },
  -- You can also specify external formatters in here.
  formatters_by_ft = {
    lua = { 'stylua' },
    rust = { 'rustfmt' },
    python = { 'ruff_format', 'ruff_fix' },
    terraform = { 'terraform_fmt' },
  },
}

vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"

local conform = require 'conform'
local format = function()
  conform.format()
  vim.cmd 'GuessIndent silent'
end
vim.keymap.set({ 'n', 'x' }, 'gq', format, { desc = 'Format Buffer' })
