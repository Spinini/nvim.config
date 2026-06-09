local ai_plugins = {
  gh 'yetone/avante.nvim',
  gh 'nvim-lua/plenary.nvim',
  gh 'MunifTanjim/nui.nvim',
  gh 'zbirenbaum/copilot.lua',
}
vim.pack.add(ai_plugins)

require('copilot').setup {
  suggestion = { enabled = false },
  panel = { enabled = false },
}

require('avante').setup {
  provider = 'copilot',
}
