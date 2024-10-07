vim.opt.termguicolors = true

require('config.lazy')
-- Load mappings
require('mappings').setup()

-- Load commands
require('commands.ReloadCfg').setup()
