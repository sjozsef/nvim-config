vim.opt.termguicolors = true
vim.opt.showmode = false

require('config.lazy')
-- Load mappings
require('mappings').setup()

-- Load commands
require('commands.ReloadCfg').setup()
