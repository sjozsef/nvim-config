vim.opt.termguicolors = true
vim.opt.showmode = false

vim.opt.ignorecase = true
vim.opt.smartcase = true

require('config.lazy')
-- Load mappings
require('mappings').setup()

-- Load commands
require('commands.ReloadCfg').setup()
