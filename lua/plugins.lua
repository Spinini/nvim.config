require 'plugins/pack-rebuild'

function gh(repo) return 'https://github.com/' .. repo end

-- Load theme first
require 'plugins/theme'
-- Load Mason and install required tools
require 'plugins/mason'
-- Activate LSP servers
require 'plugins/lsp'
-- Activate Formatters
require 'plugins/format'
-- Activate Linters
require 'plugins/lint'
-- Load remaining Plugins
require 'plugins/misc'
require 'plugins/autocomplete'
require 'plugins/debug'
require 'plugins/mini-cfg'
require 'plugins/files'
require 'plugins/status-line'
-- require 'plugins/telescope'
require 'plugins/snacks'
require 'plugins/treesitter'
require 'plugins/ui'
