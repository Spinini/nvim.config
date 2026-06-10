-- LSP messages in lower right corner
vim.pack.add { gh 'j-hui/fidget.nvim' }
require('fidget').setup {}

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
  callback = function(event)
    local map = function(keys, func, desc, mode)
      mode = mode or 'n'
      vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
    end
    map('grn', vim.lsp.buf.rename, '[R]e[n]ame')
    map('gra', vim.lsp.buf.code_action, '[G]oto Code [A]ction', { 'n', 'x' })
    map('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
    map('grD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

    if client and client:supports_method('textDocument/inlayHint', event.buf) then
      map('<leader>th', function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf }) end, '[T]oggle Inlay [H]ints')
    end
  end,
})

vim.pack.add {
  gh 'neovim/nvim-lspconfig',
}

local servers = {
  -- Bash
  bashls = {},
  -- C/C++
  clangd = {},
  -- Lua
  lua_ls = {
    on_init = function(client)
      if client.workspace_folders then
        local path = client.workspace_folders[1].name
        if path ~= vim.fn.stdpath 'config' and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc')) then return end
      end
      client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
        runtime = {
          version = 'LuaJIT',
        },
        -- Make the server aware of Neovim runtime files
        workspace = {
          checkThirdParty = false,
          library = {
            vim.env.VIMRUNTIME,
            -- "${3rd}/luv/library"
            -- "${3rd}/busted/library",
          },
        },
      })
    end,
    settings = {
      Lua = {},
    },
  },
  -- Python
  -- basedpyright = {
  --   settings = {
  --     basedpyright = {
  --       analysis = {
  --         typeCheckingMode = 'standard',
  --       },
  --     },
  --   },
  -- },
  ty = {},
  -- Rust
  rust_analyzer = {},
  -- Terraform
  terraformls = {},
  -- Typescript
  tsgo = {},
  -- Zig
  zls = {},
}

local ensure_installed = vim.tbl_keys(servers or {})

for name, server in pairs(servers) do
  vim.lsp.config(name, server)
  vim.lsp.enable(name)
end
