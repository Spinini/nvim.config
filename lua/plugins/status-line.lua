vim.pack.add { gh 'nvim-lualine/lualine.nvim' }
require('lualine').setup {
  options = {
    icons_enabled = vim.g.have_nerd_font,
  },
}
