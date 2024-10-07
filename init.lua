vim.opt.termguicolors = true
vim.opt.showmode = false

require('config.lazy')
-- Load mappings
require('mappings').setup()

-- Load commands
require('commands.ReloadCfg').setup()

-- Tab navigation mappings
vim.api.nvim_set_keymap('n', 'J', ':BufferLineCyclePrev<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', ':', ':BufferLineCycleNext<CR>', { noremap = true, silent = true })
