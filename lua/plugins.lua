require 'plugins/pack-rebuild'

function gh(repo) return 'https://github.com/' .. repo end

-- Load theme first
require 'plugins/theme'

-- Load Mason and install required tools
require 'plugins/tooling'

-- Load remaining Plugins
require 'plugins/autocomplete'
require 'plugins/ai'
require 'plugins/debug'
require 'plugins/mini-cfg'
require 'plugins/files'
require 'plugins/status-line'
require 'plugins/snacks'
require 'plugins/treesitter'
require 'plugins/ui'
