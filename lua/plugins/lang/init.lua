require('mason').setup {
    ui = {
        icons = {
            package_installed = '✓',
            package_pending = '➜',
            package_uninstalled = '✗',
        },
    },
}

-- Ensure Mason package is installed
ensure_installed = function(package_name)
    local registry = require 'mason-registry'
    if not registry.is_installed(package_name) then vim.cmd('MasonInstall ' .. package_name) end
end

require('blink-cmp').setup {
    fuzzy = { implementation = 'lua' },
}
require('guess-indent').setup {}
require('conform').setup {}

require 'plugins.lang.cpp'
require 'plugins.lang.json'
require 'plugins.lang.lua'
require 'plugins.lang.markdown'
require 'plugins.lang.python'
require 'plugins.lang.rust'
require 'plugins.lang.slang'
require 'plugins.lang.web'
require 'plugins.lang.yaml'
require 'plugins.lang.treesitter'
require 'plugins.lang.keymaps'
