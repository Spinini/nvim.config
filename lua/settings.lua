-- Set leader keys
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Nerd fonts
vim.g.have_nerd_font = true

-- Show current line number and relative line numbers
vim.o.number = true
vim.o.relativenumber = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Hide mode, we use the status line instead
vim.o.showmode = false

-- Sync clipboard between OS and Neovim
vim.schedule(function() vim.o.clipboard = 'unnamedplus' end)

-- Make wrapped line keep the indentation of the previous line
vim.o.breakindent = true

-- Keep undo history
vim.o.undofile = true

-- Case insensitive and smart case searching
vim.o.ignorecase = true
vim.o.smartcase = true

-- Times
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Sign column
vim.o.signcolumn = 'yes'

-- Window splits
vim.o.splitright = true
vim.o.splitbelow = true

-- List space/tab/... characters
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.fillchars = { eob = ' ' }

vim.o.inccommand = 'split'

-- Highlight line in whic the cursor is
vim.o.cursorline = true

-- Number of lines to scroll off
vim.o.scrolloff = 10

-- Confirm before quitting
vim.o.confirm = true

-- Do not fold by default
vim.opt.foldenable = false

-- Configure diagnostics
vim.diagnostic.config {
  update_in_insert = false,
  severity_sort = true,
  float = { border = 'rounded', source = 'if_many' },
  underline = { severity = { min = vim.diagnostic.severity.WARN } },

  -- Can switch between these as you prefer
  virtual_text = true, -- Text shows up at the end of the line
  virtual_lines = false, -- Text shows up underneath the line, with virtual lines

  -- Auto open the float, so you can easily read the errors when jumping with `[d` and `]d`
  jump = {
    on_jump = function(_, bufnr)
      vim.diagnostic.open_float {
        bufnr = bufnr,
        scope = 'cursor',
        focus = false,
      }
    end,
  },
}

-- Highlight text before it is yanked
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function() vim.hl.on_yank() end,
})

-- Keymap to restart Neovim
vim.keymap.set('n', '<leader>pr', function() vim.cmd ':restart:' end, { desc = 'Restart Neovim' })
