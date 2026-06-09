vim.pack.add { gh 'folke/snacks.nvim', gh 'nvim-lua/plenary.nvim' }

Snacks = require 'snacks'
Snacks.setup {}

-- Scratchpad
vim.keymap.set('n', '<leader>.', function() Snacks.scratch() end, { desc = 'Toggle Scratch Buffer' })

-- Find keymaps
vim.keymap.set('n', '<leader>fk', Snacks.picker.keymaps, { desc = '[F]ind [K]eymaps' })
vim.keymap.set('n', '<leader>ff', Snacks.picker.files, { desc = '[F]ind [F]iles' })
vim.keymap.set({ 'n', 'v' }, '<leader>fw', Snacks.picker.grep_word, { desc = '[F]ind current [W]ord' })
vim.keymap.set('n', '<leader>fg', Snacks.picker.grep, { desc = '[F]ind by [G]rep' })
vim.keymap.set('n', '<leader>fd', Snacks.picker.diagnostics, { desc = '[F]ind [D]iagnostics' })
vim.keymap.set('n', '<leader>fr', Snacks.picker.resume, { desc = '[F]ind [R]esume' })
vim.keymap.set('n', '<leader>fc', Snacks.picker.commands, { desc = '[F]ind [C]ommands' })
vim.keymap.set('n', '<leader><leader>', Snacks.picker.buffers, { desc = '[ ] Find existing buffers' })

-- LSP Keymaps
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('snacks-lsp-attach', { clear = true }),
  callback = function(event)
    local buf = event.buf
    -- Find references for the word under your cursor.
    vim.keymap.set('n', 'grr', Snacks.picker.lsp_references, { buffer = buf, desc = '[G]oto [R]eferences' })
    -- Jump to the implementation of the word under your cursor.
    -- Useful when your language has ways of declaring types without an actual implementation.
    vim.keymap.set('n', 'gri', Snacks.picker.lsp_implementations, { buffer = buf, desc = '[G]oto [I]mplementation' })
    -- Jump to the definition of the word under your cursor.
    -- This is where a variable was first declared, or where a function is defined, etc.
    -- To jump back, press <C-t>.
    vim.keymap.set('n', 'grd', Snacks.picker.lsp_definitions, { buffer = buf, desc = '[G]oto [D]efinition' })
    -- Fuzzy find all the symbols in your current document.
    -- Symbols are things like variables, functions, types, etc.
    vim.keymap.set('n', 'gO', Snacks.picker.lsp_symbols, { buffer = buf, desc = 'Open Document Symbols' })
    -- Fuzzy find all the symbols in your current workspace.
    -- Similar to document symbols, except searches over your entire project.
    vim.keymap.set('n', 'gW', Snacks.picker.lsp_workspace_symbols, { buffer = buf, desc = 'Open Workspace Symbols' })
    -- Jump to the type of the word under your cursor.
    -- Useful when you're not sure what type a variable is and you want to see
    -- the definition of its *type*, not where it was *defined*.
    vim.keymap.set('n', 'grt', Snacks.picker.lsp_type_definitions, { buffer = buf, desc = '[G]oto [T]ype Definition' })
  end,
})

vim.keymap.set(
  'n',
  '<leader>/',
  function()
    Snacks.picker.lines {
      layout = {
        preset = 'dropdown',
      },
    }
  end,
  { desc = '[/] Fuzzily search in current buffer' }
)

vim.keymap.set(
  'n',
  '<leader>f/',
  function()
    Snacks.picker.grep {
      buffers = true,
      title = 'Live Grep in Open Files',
      layout = {
        preset = 'dropdown',
      },
    }
  end,
  { desc = '[F]ind [/] in Open Files' }
)
